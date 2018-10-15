//
//  Label.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import IGListKit
import RealmSwift

class Label: Object {
  // swiftlint:disable:next identifier_name
  @objc dynamic var title: String = ""
  let ownerMemos = LinkingObjects(fromType: Memo.self, property: "labels")
  
  convenience init(title: String) {
    self.init()
    self.title = title
  }
}

extension Label {
  func isLinkingMemo(memo_id: String) -> Bool {
    return ownerMemos.contains { $0.memo_id == memo_id }
  }
}

extension Label: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self
  }
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? Label else { return false }
    return self == object
  }
}
