//
//  LabelServiceType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import Result
import RxRealm
import RxSwift
import Then

protocol LabelServiceType: RealmServiceType {
  func searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>
  func insertLabel(label: Label) -> Result<String, NSError>
}

class LabelService: LabelServiceType {
  func insertLabel(label: Label) -> Result<String, NSError> {
    return catchRealmBlock { realm in
      try realm.write {
        realm.add(label)
      }
      return Result.success(label.label_id)
    }
  }
  func searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError> {
    let results = catchRealmBlock { realm -> Result<Results<Label>, NSError> in
      let results = realm.objects(Label.self).filter("title Like '*\(keyword)*'")
      return Result.success(results)
    }
    switch results {
    case let .failure(error):
      return Result.failure(error)
    case .success(let value):
      let data = Observable.collection(from: value).map { $0.toArray() }
      return Result.success(data)
    }
  }
}
