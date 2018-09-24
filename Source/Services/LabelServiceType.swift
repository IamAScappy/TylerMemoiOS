//
//  LabelServiceType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import Then
protocol LabelServiceType {
  func liveSearchLabels(keyword: String) -> Results<Label>?
}

final class LabelService: LabelServiceType {
  func liveSearchLabels(keyword: String) -> Results<Label>? {
    let realm = try? Realm()
    return realm?.objects(Label.self).filter("title Like '*\(keyword)*'")
  }
}
