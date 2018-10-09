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

class CheckListReactorTest: QuickSpec {
  override func spec() {
    var scheduler = TestScheduler(initialClock: 0)
    var reactor: CheckListReactor!
    var mockService: MockCheckListService!
    let expectCheckItems = [CheckItem(name: "1"), CheckItem(name: "2")]
    beforeEach {
      scheduler = TestScheduler(initialClock: 0)
      mockService = MockCheckListService()
      reactor = CheckListReactor(mockService)
    }
    describe("CheckListReactor") {
      beforeEach {
        stub(mockService, block: { mock in
          when(mock.getCheckItemsByMemoId(equal(to: "test"))).thenReturn(Result.success(Observable.just(expectCheckItems)))
        })
        
        let actions = scheduler.createHotObservable([
          next(50, { CheckListReactor.Action.fetchCheckItems(memoId: "test") })
          ])
        
        actions
          .map { $0() }
          .bind(to: reactor.action)
        
        scheduler.start()
      }
      it("empty", closure: {
        let result = reactor.state.map({ $0.checkItems })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()
        
        switch result {
        case .completed(let results):
          expect(results.first) == expectCheckItems
        default: break
        }
      })
    }
  }
}
