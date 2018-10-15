//
//  MemoListReactor.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 14..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class MemoListReactor: Reactor {
  let initialState: State = State()
  private let service: MemoServiceType
  
  init(_ service: MemoServiceType) {
    self.service = service
  }

  enum Action {
    case searchMemos(keyword: String)
  }
  struct State {
    var memos: [Memo]?
    var error: Error?
    var keyword: String?
  }
  enum Mutation {
    case setMemos([Memo])
    case updateQuery(String)
    case error(Error)
  }
  func mutate(action: Action) -> Observable<Mutation> {
    log.debug("mutate action: \(action)")
    switch action {
    case .searchMemos(let keyword):
      return Observable.concat([
        Observable.just(Mutation.updateQuery(keyword)),
        Observable.deferred({ () -> Observable<Mutation> in
          let result = self.service.searchMemos(keyword)
          switch result {
          case .success(let value):
            return value.map { Mutation.setMemos($0) }
          case .failure(let error):
            return Observable.just(Mutation.error(error))
          } })
        ])
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .setMemos(let memos):
      newState.memos = memos
    case .error(let error):
      newState.error = error
    case .updateQuery(let keyword):
      newState.keyword = keyword
    }
    return newState
  }
}
