//
//  ColorThemeServiceTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 30..
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
import ReactorKit

@testable import TyperMemo

class ColorThemeReactorTest: QuickSpec {
  override func spec() {
    var scheduler = TestScheduler(initialClock: 0)
    var reactor: ColorThemeReactor!
    var mockService: MockColorThemeService!
    let expectColorThemes = ColorThemeTemplate.all

    beforeEach {
      scheduler = TestScheduler(initialClock: 0)
      mockService = MockColorThemeService()
      reactor = ColorThemeReactor(mockService)
    }

    describe("ColorThemeReactor") {
      beforeEach {
        stub(mockService, block: { (mock) in
          when(mock.getAllColorTheme()).thenReturn(Result.success(Observable.just(expectColorThemes)))
        })
      }
      
      it("fetch colorthemes", closure: {
        self.reactorAction([
          next(50, { ColorThemeReactor.Action.fetchColorThemes }), // viewDidLoad
          ], scheduler: scheduler, reactor: reactor)
        
        let result = reactor.state.map({ $0.colorThemes })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()

        switch result {
        case .completed(let mertializeColorThemes):
          expect(mertializeColorThemes.last) == ColorThemeTemplate.all
        default: fail()
        }
      })
      
      it("empty colorthemes", closure: {
        reset(mockService)
        stub(mockService, block: { (mock) in
          when(mock.getAllColorTheme()).thenReturn(Result.success(Observable.just([])))
        })
        self.reactorAction([
          next(50, { ColorThemeReactor.Action.fetchColorThemes }), // viewDidLoad
          ], scheduler: scheduler, reactor: reactor)
        
        let result = reactor.state.map({ $0.isEmpty })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()
        switch result {
        case .completed(let isEmpty):
          expect(isEmpty.last!) == true
        default: fail()
        }
      })
      
      it("error colorthemes", closure: {
        reset(mockService)
        stub(mockService, block: { (mock) in
          when(mock.getAllColorTheme()).thenReturn(Result.failure(TestError()))
        })
        self.reactorAction([
          next(50, { ColorThemeReactor.Action.fetchColorThemes }), // viewDidLoad
          ], scheduler: scheduler, reactor: reactor)
        
        let result = reactor.state.map({ $0.error })
          .take(0.1, scheduler: MainScheduler.instance)
          .toBlocking()
          .materialize()
        switch result {
        case .completed(let error):
          expect(error.last!) is TestError
        default: fail()
        }
      })
    }
  }
}

fileprivate extension QuickSpec {
  func reactorAction(_ actions: [Recorded<Event<() -> ColorThemeReactor.Action>>], scheduler: TestScheduler, reactor: ColorThemeReactor) {
    let actions = scheduler.createHotObservable(actions)
    
    actions
      .map { $0() }
      .bind(to: reactor.action)
    
    scheduler.start()
  }
}
