//
//  CheckItem.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import RealmSwift

class CheckItem: Object {
  // swiftlint:disable:next identifier_name
  @objc dynamic var check_item_id: String = UUID().uuidString
  @objc dynamic var name: String = ""
  @objc dynamic var done: Bool = false
  convenience init(name: String, done: Bool = false) {
    self.init()
    self.name = name
    self.done = done
  }
  override static func primaryKey() -> String {
    return "check_item_id"
  }
}
