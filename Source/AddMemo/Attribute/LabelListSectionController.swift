//
//  LabelListSectionController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit

enum EllipsizeMode {
  case none
  case end
}

final class LabelViewItem: NSObject {
  let ellipsizeMode: EllipsizeMode
  let ellipsizeCount: Int
  var items: [Label] = []

  public init(items: [Label] = [], ellipsizeMode: EllipsizeMode = .none, ellipsizeCount: Int = Int.max) {
    self.ellipsizeMode = ellipsizeMode
    self.ellipsizeCount = ellipsizeCount
    self.items = items
  }
  
}
extension LabelViewItem: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self
  }
  
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return self === object ? true : self.isEqual(object)
  }
}

class LabelListSectionController: ListSectionController {
  private var object: LabelViewItem?
  
  override init() {
    super.init()
//    inset = UIEdgeInsets(top: 0, left: Dimens.AddMemo.documentOfMargine.rawValue, bottom: 10, right: Dimens.AddMemo.documentOfMargine.rawValue)
//    minimumLineSpacing = 4
//    minimumInteritemSpacing = 4
  }
  override func numberOfItems() -> Int {
    return object?.items.count ?? 0
  }
  override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext!.containerSize.width, height: 55)
  }
  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: TagLabelCell.self, for: self, at: index) as? TagLabelCell else {
      fatalError()
    }
    guard let item = object?.items[index] else { return cell }
    cell.configCell(item)
    return cell
  }
  override func didUpdate(to object: Any) {
    self.object = object as? LabelViewItem
  }
}
