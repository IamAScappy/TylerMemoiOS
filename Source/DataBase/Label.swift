//
//  Label.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import RealmSwift
import IGListKit

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

extension Label: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return label_id as NSObjectProtocol
  }
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? Memo else { return false }
    return self == object
  }
}
