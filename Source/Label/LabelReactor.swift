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
  let provider: ServiceProviderType

  init(provider: ServiceProviderType) {
    self.initialState = State(
      isEmpty: false,
      sections: []
    )
    self.provider = provider
  }
  enum Action {
    case searchQuery(memoId: String, String)
  }
  struct State {
    var isEmpty: Bool
    var sections: [Label]?
  }
  enum Mutation {
    case setSections([Label])
  }

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .searchQuery(memoId, keyword):
      if let liveLabels = self.provider.labelService.liveSearchLabels(keyword: "") {
        return Observable.collection(from: liveLabels).map { Mutation.setSections($0.toArray()) }
      } else {
        return Observable.empty()
      }
    }
  }
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .setSections(let labels):
      newState.isEmpty = labels.isEmpty
    }
    return newState
  }
}
