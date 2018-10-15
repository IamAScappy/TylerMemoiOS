//
//  SelectLabelReactor.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import ReactorKit
import RealmSwift
import Result
import RxRealm
import RxSwift

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
    return .empty()
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
