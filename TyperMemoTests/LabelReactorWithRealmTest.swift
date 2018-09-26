//
//  LabelReactorWithRealmTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 26..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Nimble
import Quick
import RxTest
import RxSwift
import RxCocoa
import RxBlocking
import RealmSwift
import Cuckoo
@testable import TyperMemo


class LabelReactorWithRealmTest: RealmSpec {
  override func spec() {
    describe("LabelReactorWithRealmTest") {
      var scheduler = TestScheduler(initialClock: 0)
      var reactor: LabelReactor!
      var labelService: LabelService!
      beforeEach {
        labelService = LabelService()
        reactor = LabelReactor(labelService: labelService)
      }
      it("init data ", closure: {
        
        let expectLabels = [Label(title: "test 1"), Label(title: "test 2")]
        let actions = scheduler.createHotObservable([
          next(50, { LabelReactor.Action.searchQuery(memoId: "", "") }),
          next(55, { LabelReactor.Action.newLabel(expectLabels[0]) }),
          next(60, { LabelReactor.Action.newLabel(expectLabels[1]) })
          ])
        
        actions
          .map { $0() }
          .bind(to: reactor.action)
        
        scheduler.start()
        
        let result = reactor.state.map({ $0.sections })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()
        
        switch result {
        case .completed(let labels):
          expect(labels.count) == 2
          expect(labels.last) == expectLabels
        default: break
        }
      })
    }
  }
}
