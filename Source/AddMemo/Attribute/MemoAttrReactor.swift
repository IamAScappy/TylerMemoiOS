//
//  MemoAttributeReactor.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class MemoAttrReactor: Reactor {
  let initialState: State = State()
  let memoService: MemoServiceType

  init(_ memoService: MemoServiceType) {
    self.memoService = memoService
  }
  enum Action {
    case aaaa
    case loadedMemo(Memo)
    case makeCheckItem
  }
  struct State {
    var memo: Memo = Memo.empty()
    var error: Error?
  }
  enum Mutation {
    case setMemo(Memo)
    case error(Error)
    case appendCheckItem()
  }
  func mutate(action: Action) -> Observable<Mutation> {
    log.debug("mutate action: \(action)")
    switch action {
    case .loadedMemo(let memo):
      return Observable.deferred({ () -> Observable<Mutation> in
        let result = self.memoService.getMemoOrDefault(memo)
        switch result {
        case .success(let value):
          return value.map { Mutation.setMemo($0) }
        case .failure(let error):
          return Observable.just(Mutation.error(error))
        }
      })
    case .makeCheckItem:
      return Observable.just(Mutation.appendCheckItem())
    case .aaaa:
      return Observable.just(Mutation.appendCheckItem())
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .setMemo(let memo):
      newState.memo = memo
    case .error(let error):
      newState.error = error
    case .appendCheckItem:
      state.memo.checkList.append(CheckItem(name: ""))
      newState.memo = state.memo
    }
    return newState
  }
}
