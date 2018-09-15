//
//  Memo.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import RealmSwift

class Memo: Object {
  @objc dynamic var attr: MemoAttribute = MemoAttribute()
  @objc dynamic var createAt = Date()
}

class MemoAttribute: Object {
  @objc dynamic var isPin = false
}
