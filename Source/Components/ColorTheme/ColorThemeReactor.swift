//
//  ColorThemeReactor.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class ColorThemeReactor: Reactor {
  private var colorThemeService: ColorThemeType
  let initialState: State = State()

  init(_ colorThemeService: ColorThemeType) {
    self.colorThemeService = colorThemeService
  }
  

  enum Action {
    case fetchColorThemes
  }
  struct State {
    var colorThemes: [ColorTheme]?
    var error: Error?
    var isEmpty: Bool?
  }
  enum Mutation {
    case setColorThemes([ColorTheme]?)
    case error(Error)
    case isEmpty(Bool)
  }
  func mutate(action: Action) -> Observable<Mutation> {
    log.debug("mutate action: \(action)")
    switch action {
    case .fetchColorThemes:
      return Observable.deferred({ [weak self] () -> Observable<Mutation> in
        guard let self = self else { return Observable.just(Mutation.isEmpty(true)) }
        let result = self.colorThemeService.getAllColorTheme()
        switch result {
        case .success(let value):
          return value.map {
            if $0.isEmpty {
              return Mutation.isEmpty(true)
            } else {
              return Mutation.setColorThemes($0)
            }
          }
        case .failure(let error):
          return Observable.just(Mutation.error(error))
        }
      })
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    newState.isEmpty = false
    newState.error = nil
    switch mutation {
    case let .setColorThemes(colorThemes):
      newState.colorThemes = colorThemes
    case .error(let error):
      newState.error = error
    case .isEmpty(let empty):
      newState.isEmpty = empty
    }
    log.info("reduece mutation: state.colorThemes[\(String(describing: newState.colorThemes?.count))]\n")
    return newState
  }
}
