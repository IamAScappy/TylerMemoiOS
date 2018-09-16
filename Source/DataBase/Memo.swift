//
//  Memo.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import RealmSwift

class Memo: Object, HasId {
  @objc dynamic var id: String = UUID().uuidString
  @objc dynamic var text: String = ""
  @objc dynamic var attr: MemoAttribute? = MemoAttribute()
  @objc dynamic var createAt = Date()
  let labels = List<Label>()
  let checkList = List<CheckItem>()
  convenience init(text: String) {
    self.init()
    self.text = text
  }
  override static func primaryKey() -> String {
    return "id"
  }
}

class MemoAttribute: Object {
  @objc dynamic var isPin = false
}
