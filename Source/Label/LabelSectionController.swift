//
//  LabelSectionController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit

class LabelSectionController: ListBindingSectionController<Label>, ListBindingSectionControllerDataSource, NewLabelCellDelegate {
  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    minimumLineSpacing = 4
    minimumInteritemSpacing = 4
    dataSource = self
  }

  func sectionController(
    _ sectionController: ListBindingSectionController<ListDiffable>,
    viewModelsFor object: Any) -> [ListDiffable] {
    var results = [ListDiffable]()
    switch object {
    case is Label:
      if let object = object as? Label {
        results.append(LabelViewModel(label: object.title))
      }
    case is NewLabelModel:
      if let object = object as? NewLabelModel {
        results.append(object)
      }
    default: fatalError()
    }
    return results
  }
  func sectionController(
    _ sectionController: ListBindingSectionController<ListDiffable>,
    cellForViewModel viewModel: Any,
    at index: Int) -> UICollectionViewCell & ListBindable {

    let cellClass: AnyClass

    switch viewModel {
    case is LabelViewModel: cellClass = ExistLabelCell.self
    default: cellClass = NewLabelCell.self
    }
    guard let cell = collectionContext?.dequeueReusableCell(of: cellClass, for: self, at: index)
    as? UICollectionViewCell & ListBindable
      else { fatalError("can't dequeueReusableCell identifier: [\(cellClass)] index: \(index)") }
    if let cell = cell as? NewLabelCell {
      cell.delegate = self
    }
    return cell
  }
  func sectionController(
    _ sectionController: ListBindingSectionController<ListDiffable>,
    sizeForViewModel viewModel: Any,
    at index: Int) -> CGSize {
    guard let width = collectionContext?.containerSize.width else { return .zero }
    guard let height = collectionContext?.containerSize.height else { return .zero }
    switch viewModel {
    case is LabelViewModel, is NewLabelModel: return CGSize(width: width, height: CGFloat(Dimens.labelHeight.rawValue))
    default: return CGSize(width: width, height: height)
    }
  }
  func makeNewLabel(_ cell: NewLabelCell) {
  }
}
