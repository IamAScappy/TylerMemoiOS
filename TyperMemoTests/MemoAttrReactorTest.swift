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

class MemoAttrReactorTest: QuickSpec {
  override func spec() {
    var scheduler = TestScheduler(initialClock: 0)
    var reactor: MemoAttrReactor!
    var mockService: MockMemoService!
    var expectMemo = Memo(text: "test").then {
      $0.checkList.append(CheckItem(name: "c1"))
      $0.checkList.append(CheckItem(name: "c2"))
      $0.labels.append(Label(title: "l1"))
      $0.labels.append(Label(title: "l2"))
    }
    beforeEach {
      scheduler = TestScheduler(initialClock: 0)
      mockService = MockMemoService()
      reactor = MemoAttrReactor(mockService)
    }
    describe("MemoAttrReactor") {
      beforeEach {
        stub(mockService, block: { mock in
          when(mock.getMemoOrDefault(any())).thenReturn(Result.success(Observable.just(expectMemo)))
        })
        let actions = scheduler.createHotObservable([
          next(50, { MemoAttrReactor.Action.loadedMemo(expectMemo) })
          ])

        actions
          .map { $0() }
          .bind(to: reactor.action)

        scheduler.start()
      }
      it("loaded memo", closure: {
        let result = reactor.state.map({ $0.memo })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()

        switch result {
        case .completed(let results):
          expect(results.first) == expectMemo
        default: break
        }
      })
    }
  }
}
