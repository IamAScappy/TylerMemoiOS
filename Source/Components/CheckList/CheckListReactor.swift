//
//  CheckListReactor.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class CheckListReactor: Reactor {
  let initialState: State = State()
  let service: CheckListType
  init(_ service: CheckListType) {
    self.service = service
  }

  enum Action {
    case fetchMemo(memo: Memo)
    case makeCheckItem(memo: Memo)
  }
  struct State {
    var memo: Memo?
    var error: Error?
    var checkListViewModels: [CheckListViewModel]?
  }
  enum Mutation {
    case error(Error)
    case setMemo(Memo)
  }
  func mutate(action: Action) -> Observable<Mutation> {
    log.debug("mutate action: \(action)")
    switch action {
    case .fetchMemo(let memo):
      return Observable.just(Mutation.setMemo(memo))
    case .makeCheckItem(let memo):
      let result = self.service.insertCheckItem(memo: memo, checkItem: CheckItem(name: ""))
      switch result {
      case .success(let memo):
        return Observable.just(Mutation.setMemo(memo))
      case .failure(let error):
        return Observable.just(Mutation.error(error))
      }
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    newState.error = nil
    switch mutation {
    case let .setMemo(memo):
      newState.memo = memo
      newState.checkListViewModels = [CheckListViewModel(header: "Check Items", items: memo.checkList.toArray())]
    case .error(let error):
      newState.error = error
    }
    log.info("reduece [\(String(describing: newState.memo))]\n")
    return newState
  }
}
