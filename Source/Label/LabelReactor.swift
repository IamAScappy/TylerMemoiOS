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

class LabelReactor: Reactor {
  let initialState: State
  let labelService: LabelServiceType

  init(labelService: LabelServiceType) {
    self.initialState = State(
      sections: []
    )
    self.labelService = labelService
  }
  enum Action {
    case searchQuery(memoId: String, String)
  }
  struct State {
    var sections: [Label]?
  }
  enum Mutation {
    case setSections([Label])
  }
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .searchQuery(memoId, keyword):
      if let labels = self.labelService.searchLabels(keyword: keyword) {
        return .just(.setSections(labels))
      } else {
        return .empty()
      }
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .setSections(let labels):
      newState.sections = labels
    }
    return newState
  }
}
