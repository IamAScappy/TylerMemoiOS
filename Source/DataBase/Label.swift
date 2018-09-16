//
//  Label.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Foundation
import RealmSwift

class Label: Object, HasId {
  @objc dynamic var id: String = UUID().uuidString
  @objc dynamic var title: String = ""
  let ownerMemos = LinkingObjects(fromType: Memo.self, property: "labels")
}

extension Label {
  func isLinkingMemo(memoId: String) -> Bool {
    return ownerMemos.first(where: { $0.id == memoId }) != nil
  }
}
