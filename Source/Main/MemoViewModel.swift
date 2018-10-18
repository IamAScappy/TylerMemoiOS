//
//  MemoViewModel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxDataSources
import IGListKit
//class MemoViewModel: NSObject {
//  let memoPreviews: [MemoPreviewModel]
//
//  public init(memoPreviews: [MemoPreviewModel]) {
//    self.memoPreviews = memoPreviews
//  }
//}
//extension MemoViewModel: ListDiffable {
//  func diffIdentifier() -> NSObjectProtocol {
//    return self
//  }
//  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
//    return self === object ? true : self.isEqual(object)
//  }
//}
struct MemoViewModel {
  var header: String
  var items: [Item]
}

extension MemoViewModel: AnimatableSectionModelType {
  typealias Item = MemoPreviewModel

  var identity: String {
    return header
  }

  init(original: MemoViewModel, items: [Item]) {
    self = original
    self.items = items
  }
}

extension MemoPreviewModel: IdentifiableType, Equatable {

  var identity: String {
    return ""
  }
  static func == (lhs: MemoPreviewModel, rhs: MemoPreviewModel) -> Bool {
    return true
  }
  
  
}
//
//extension MemoViewModel: ListDiffable {
//  func diffIdentifier() -> NSObjectProtocol {
//    return self
//  }
//  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
//    return self === object ? true : self.isEqual(object)
//  }
//}
