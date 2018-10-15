//
//  MemoViewModel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit

class MemoViewModel: NSObject {
  let text: String
  let labels: [Label]
  let checkItems: [CheckItem]

  public init(text: String, labels: [Label], checkItems: [CheckItem]) {
    self.text = text
    self.labels = labels
    self.checkItems = checkItems
  }

}
extension MemoViewModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self
  }
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return self === object ? true : self.isEqual(object)
  }
}
