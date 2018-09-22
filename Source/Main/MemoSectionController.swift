//
//  MemoSectionController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

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


//class MemoSectionController: ListBindingSectionController<MemoViewModel>, ListBindingSectionControllerDataSource {
//  override init() {
//    super.init()
//    dataSource = self
//    minimumInteritemSpacing = 4
//    minimumLineSpacing = 4
//  }
//  func sectionController(
//    _ sectionController: ListBindingSectionController<ListDiffable>,
//    viewModelsFor object: Any) -> [ListDiffable] {
//    guard let object = object as? MemoViewModel else { fatalError() }
//    let results: [ListDiffable] = [
//      object
//    ]
//    return results
//  }
//  func sectionController(
//    _ sectionController: ListBindingSectionController<ListDiffable>,
//    cellForViewModel viewModel: Any,
//    at index: Int) -> UICollectionViewCell & ListBindable {
//
//    let cellClass: AnyClass
//
//    switch viewModel {
//    case is MemoViewModel:
//      cellClass = MemoViewCell2.self
//    default:
//      cellClass = MemoViewCell2.self
//    }
//    guard let cell = collectionContext?.dequeueReusableCell(of: cellClass, for: self, at: index)
//    as? UICollectionViewCell & ListBindable
//      else { fatalError("can't dequeueReusableCell identifier: [\(cellClass)] index: \(index)") }
//    return cell
//  }
//  func sectionController(
//    _ sectionController: ListBindingSectionController<ListDiffable>,
//    sizeForViewModel viewModel: Any,
//    at index: Int) -> CGSize {
//    guard let width = collectionContext?.containerSize.width else { return .zero }
//    guard let height = collectionContext?.containerSize.height else { return .zero }
//    switch viewModel {
//    case is MemoViewModel:
//      return CGSize(width: collectionContext!.containerSize.width, height: 55)
//    default:
//      return CGSize(width: width, height: height)
//    }
//  }
//}
//
//
