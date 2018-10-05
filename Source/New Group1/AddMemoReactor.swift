//
//  AddMemoReactor.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 6..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class AddMemoReactor: Reactor {
  let initialState: State = State()

  init() {
  }

  enum Action {
    case toggleColorTheme
  }
  struct State {
    var isShowColorTheme: Bool = false
  }
  enum Mutation {
    case toggleColorTheme
  }
  func mutate(action: Action) -> Observable<Mutation> {
    log.debug("mutate action: \(action)")
    switch action {
    case .toggleColorTheme:
      return Observable.just(Mutation.toggleColorTheme)
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .toggleColorTheme:
      newState.isShowColorTheme = !state.isShowColorTheme
    }
    return newState
  }
}
