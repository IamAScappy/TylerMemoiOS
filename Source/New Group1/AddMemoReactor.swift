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
  private let service: MemoServiceType
  init(_ memoService: MemoServiceType) {
    service = memoService
  }
  enum Action {
    case toggleColorTheme
    case viewLabel
    case loadedMemoView(memo: Memo)
  }
  struct State {
    var memo: Memo?
    var isShowColorTheme: Bool = false
    var isShowLabel: Bool = false
  }
  enum Mutation {
    case saveMemo(memo: Memo)
    case toggleColorTheme
    case viewLabel
  }
  func mutate(action: Action) -> Observable<Mutation> {
    log.debug("mutate action: \(action)")
    switch action {
    case .loadedMemoView(let memo):
      return Observable.just(Mutation.saveMemo(memo: memo))
    case .toggleColorTheme:
      return Observable.just(Mutation.toggleColorTheme)
    case .viewLabel:
      return Observable.just(Mutation.viewLabel)
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    newState.isShowLabel = false
    switch mutation {
    case .saveMemo(let memo):
      newState.memo = memo
    case .toggleColorTheme:
      newState.isShowColorTheme = !state.isShowColorTheme
    case .viewLabel:
      newState.isShowLabel = true
      newState.isShowColorTheme = false
    }
    return newState
  }
}