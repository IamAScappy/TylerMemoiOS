//
//  AddMemoReactorTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 10. 6..
//  Copyright © 2018년 tskim. All rights reserved.
//
import Nimble
import Quick
import XCTest
import RxTest
import RxSwift
import ReactorKit
@testable import TyperMemo

class AddMemoReactorTest: QuickSpec {
  override func spec() {
    var scheduler = TestScheduler(initialClock: 0)
    var reactor: AddMemoReactor!
    var mockService: MockMemoService!
    var expectMemo = Memo(text: "test")
    beforeEach {
      scheduler = TestScheduler(initialClock: 0)
      mockService = MockMemoService()
      reactor = AddMemoReactor(mockService)
    }
    describe("AddMemoReactorTest") {
      it("a", closure: {
        let actions = scheduler.createHotObservable([
          next(50, { AddMemoReactor.Action.loadedMemoView(memo: expectMemo) })
          ])
        
        actions
          .map { $0() }
          .bind(to: reactor.action)
        
        scheduler.start()
        
        let result = reactor.state.map({ $0.memo })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()
        
        switch result {
        case .completed(let results):
          expect(results.count) == 1
          expect(results.first) == expectMemo
        default: break
        }
      })
    }
  }
}
