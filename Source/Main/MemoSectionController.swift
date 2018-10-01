//
//  MemoSectionController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

class MemoSectionController: ListSectionController {
  private var model: MemoViewModel!

  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    minimumLineSpacing = 4
    minimumInteritemSpacing = 4
  }

  override func numberOfItems() -> Int {
    return model.memos.count
  }

  override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext!.containerSize.width, height: 55)
  }

  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: MemoViewCell.self, for: self, at: index) as? MemoViewCell else {
      fatalError()
    }
    let memo = model.memos[index]
    cell.preview.text = memo.text
    return cell
  }
  override func didUpdate(to object: Any) {
    self.model = object as? MemoViewModel
  }
}
