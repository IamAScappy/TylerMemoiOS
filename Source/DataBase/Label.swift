//
//  Label.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import RealmSwift

class Label: Object {
  // swiftlint:disable:next identifier_name
  @objc dynamic var label_id: String = UUID().uuidString
  @objc dynamic var title: String = ""
  let ownerMemos = LinkingObjects(fromType: Memo.self, property: "labels")
  convenience init(title: String) {
    self.init()
    self.title = title
  }
  override static func primaryKey() -> String {
    return "label_id"
  }
}

extension Label {
  func isLinkingMemo(memoId: String) -> Bool {
    return ownerMemos.contains { $0.memo_id == memoId }
  }
}
