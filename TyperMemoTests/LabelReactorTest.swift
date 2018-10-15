//
//  LabelReactorTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 23..
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

class LabelReactorTest: QuickSpec {
  override func spec() {

    var scheduler = TestScheduler(initialClock: 0)
    var reactor: LabelReactor!
    var mockLabelService: MockLabelService!
    let expectLabels = [Label(title: "asd"), Label(title: "zxc")]
    beforeEach {
      scheduler = TestScheduler(initialClock: 0)
      mockLabelService = MockLabelService()
      reactor = LabelReactor(labelService: mockLabelService)
    }
    func action(_ actions: [Recorded<Event<() -> LabelReactor.Action>>]) -> MaterializedSequenceResult<[Label]?> {
      let actions = scheduler.createHotObservable(actions)

      actions
        .map { $0() }
        .bind(to: reactor.action)

      scheduler.start()

      return reactor.state.map({ $0.sections })
        .take(0.1, scheduler: MainScheduler.instance)
        .toBlocking()
        .materialize()
    }
    describe("LabelReactor") {
      beforeEach {
//        stub(mockLabelService, block: { (mock) in
//          when(mock.searchLabels(keyword: any())).thenReturn(Result.success(Observable.just(expectLabels)))
//          when(mock.searchLabels(keyword: "error")).thenReturn(Result.failure(TestError()))
//          when(mock.insertLabel(label: any())).thenReturn(Result.success("test id"))
//        })
      }

      it("fetch labels when calling viewDidLoad ", closure: {
        let result = action([
          next(50, { LabelReactor.Action.searchQuery(memoId: "", "") }), // viewDidLoad
          ])
        switch result {
        case .completed(let element):
          expect(element.first) == expectLabels
        default: fail()
        }
      })
      it("fail to fetch when calling viewDidLoad ", closure: {
        action([
          next(50, { LabelReactor.Action.searchQuery(memoId: "", "error") }), // viewDidLoad
          ])

        let result = try! reactor.state.map({ $0.error })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()

        switch result {
        case .completed(let element):
          expect(element.count) == 1
          expect(type(of: element.last)) is TestError
        default: fail()
        }
      })
    }
  }
}
