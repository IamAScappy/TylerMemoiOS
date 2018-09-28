//
//  SelectLabelReactor.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift
import RxRealm
import RealmSwift
import Result
class LabelReactor: Reactor {
  let initialState: State
  let labelService: LabelServiceType

  init(labelService: LabelServiceType) {
    self.initialState = State()
    self.labelService = labelService
  }
  enum Action {
    case searchQuery(memoId: String, String)
    case createLabel(Label)
  }
  struct State {
    var sections: [Label]?
    var keyword: String?
    var error: Error?
    var isEmpty: Bool?
  }
  enum Mutation {
    case setSections([Label]?)
    case updateQuery(String)
    case createdLabel(String)
    case error(Error)
  }
  func mutate(action: Action) -> Observable<Mutation> {
    log.debug("mutate action: \(action)")
    switch action {
    case let .searchQuery(memoId, keyword):
      return Observable.concat([
        Observable.just(Mutation.updateQuery(keyword)),
        Observable.deferred({ () -> Observable<Mutation> in
          let result = self.labelService.searchLabels(keyword: keyword)
          switch result {
          case .success(let value):
            return value.map { Mutation.setSections($0) }
          case .failure(let error):
            return Observable.just(Mutation.error(error))
          } })
        ])
    case .createLabel(let newLabel):
      let result = self.labelService.insertLabel(label: newLabel)
      switch result {
      case .success(let labelId):
        return Observable.just(Mutation.createdLabel(labelId))
      case .failure(let error):
        return Observable.just(Mutation.error(error))
      }
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    log.info("reduece mutation: \(state)\n")
    var newState = state
    switch mutation {
    case .setSections(let labels):
      newState.isEmpty = labels?.isEmpty
      newState.sections = labels
    case .updateQuery(let keyword):
      newState.keyword = keyword
    case .createdLabel: break
    case .error(let error):
      newState.error = error
    }
    return newState
  }
}
