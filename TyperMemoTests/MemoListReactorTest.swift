//
//  CheckListReactorTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//
import Nimble
import Quick
import RxTest
import RxSwift
import RxCocoa
import RxBlocking
import Cuckoo
import Result
@testable import TyperMemo

class MemoListReactorTest: RealmSpec {
  override func spec() {
    var scheduler = TestScheduler(initialClock: 0)
    var reactor: MemoListReactor!
    var service: MemoServiceType!
    beforeEach {
      service = MemoService()
      scheduler = TestScheduler(initialClock: 0)
      reactor = MemoListReactor(service)
    }
    describe("MemoListReactor") {
      it("search memos for keyword", closure: {
        let expectMemos = [Memo(text: "123"), Memo(text: "321")]
        service.insertMemos(expectMemos)
        service.insertMemo(Memo(text: "zzxcaasd"))
        
        let expectKeyword = "1"
        let actions = scheduler.createHotObservable([
          next(0, { MemoListReactor.Action.searchMemos(keyword: expectKeyword) })
          ])
        
        actions
          .map { $0() }
          .bind(to: reactor.action)
        
        scheduler.start()
        
        let result = reactor.state.map({ $0.memos })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()
        
        switch result {
        case .completed(let results):
          expect(results.count) == 1
          let actualMemos = results[0]!
          expect(actualMemos) == expectMemos
        default: fail()
        }
      })
    }
  }
}
