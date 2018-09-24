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
import ReactiveSwift
@testable import TyperMemo

class LabelReactorTest: QuickSpec {
  override func spec() {
    describe("LabelReactor") {
      var scheduler = TestScheduler(initialClock: 0)
      var reactor: LabelReactor!
      var mockLabelService: MockLabelService!
      beforeEach {
        scheduler = TestScheduler(initialClock: 0)
        mockLabelService = MockLabelService()
        reactor = LabelReactor(labelService: mockLabelService)
      }

      it("fetch labels when calling viewDidLoad ", closure: {
        let expectLabels = [Label(title: "asd"), Label(title: "zxc")]
        stub(mockLabelService, block: { (mock) in
          when(mock.searchLabels(keyword: any())).thenReturn(expectLabels)
        })
        let viewDidLaod = scheduler.createHotObservable([next(50, ())])
        viewDidLaod
          .map { _ in LabelReactor.Action.searchQuery(memoId: "", "") }
          .bind(to: reactor.action)

        scheduler.start()
        
        let result = reactor.state.map({ $0.sections })
          .take(1)
          .toBlocking()
          .materialize()
        
        switch result {
        case .completed(let element):
          expect(element.first) == expectLabels
        default: fail()
        }
      })
    }
  }
}
