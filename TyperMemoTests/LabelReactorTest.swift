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
@testable import TyperMemo

class LabelReactorTest: QuickSpec {
  override func spec() {
    describe("LabelReactor") {
      let disposeBag = DisposeBag()
      let scheduler = TestScheduler(initialClock: 0)
      let viewDidLaod = scheduler.createHotObservable([next(50, ())])
      var mockProvider = MockServiceProviderType()
      var reactor = LabelReactor(provider: mockProvider)
      it("fetch labels when calling viewDidLoad ", closure: {
        viewDidLaod
          .map { _ in LabelReactor.Action.searchQuery(memoId: "", "") }
          .bind(to: reactor.action)
          .disposed(by: disposeBag)
        
        reactor.state.map({ $0.sections }).asDriver(onErrorJustReturn: []).drive(onNext: { result in
          
        }).disposed(by: disposeBag)
      })
    }
  }
}
