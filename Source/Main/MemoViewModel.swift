//
//  MemoViewModel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit

enum MemoViewModelType: Int {
  case none
}

class MemoViewModel: NSObject {
  let memos: [Memo]
  let type: MemoViewModelType
  
  public init(memos: [Memo], type: MemoViewModelType = .none) {
    self.memos = memos
    self.type = type
  }
}
extension MemoViewModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self
  }
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return isEqual(object)
  }
}
