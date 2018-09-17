//
//  Memo.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import RealmSwift

class Memo: Object {
  // swiftlint:disable:next identifier_name
  @objc dynamic var memo_id: String = UUID().uuidString
  @objc dynamic var text: String = ""
  @objc dynamic var attr: MemoAttribute? = MemoAttribute()
  @objc dynamic var colorTheme: ColorTheme?
  @objc dynamic var createAt = Date()
  let labels = List<Label>()
  let checkList = List<CheckItem>()
  convenience init(text: String, colorTheme: ColorTheme = ColorThemeTemplate.white) {
    self.init()
    self.text = text
    self.colorTheme = colorTheme
  }
  override static func primaryKey() -> String {
    return "memo_id"
  }
}

class MemoAttribute: Object {
  @objc dynamic var isPin = false
}
