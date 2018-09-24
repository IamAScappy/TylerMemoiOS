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
  func searchLabels(keyword: String) -> [Label]?
}

class LabelService: LabelServiceType {
  func searchLabels(keyword: String) -> [Label]? {
    let realm = try? Realm()
    return realm?.objects(Label.self).filter("title Like '*\(keyword)*'").toArray()
  }
}
