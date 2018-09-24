//
//  NewLabelModel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit

class NewLabelModel: NSObject {
  let title: String

  public init(title: String) {
    self.title = L10n.makeToNewLabelCaption(title)
  }
}

extension NewLabelModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self as NSObjectProtocol
  }
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? NewLabelModel else { return false }
    return title == object.title
  }
}
