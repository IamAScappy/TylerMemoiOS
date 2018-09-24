//
//  LabelViewModel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit

class LabelViewModel: NSObject {
  let label: String
  
  public init(label: String) {
    self.label = label
  }
}

extension LabelViewModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self as NSObjectProtocol
  }
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? LabelViewModel else { return false }
    return label == object.label
  }
}
