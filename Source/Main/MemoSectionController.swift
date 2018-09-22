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

class MemoViewModel: ListDiffable, Equatable {
  let id: String
  let text: String
  let colorTheme: ColorTheme?

  public init(id: String, text: String, colorTheme: ColorTheme?) {
    self.id = id
    self.text = text
    self.colorTheme = colorTheme
  }

  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? MemoViewModel else { return false }
    return self == object
  }
  static func == (lhs: MemoViewModel, rhs: MemoViewModel) -> Bool {
    return lhs.id == rhs.id && lhs.text == rhs.text
  }
}

class MemoSectionController: ListBindingSectionController<Memo>, ListBindingSectionControllerDataSource {
  override init() {
    super.init()
    dataSource = self
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    minimumInteritemSpacing = 4
    minimumLineSpacing = 4
  }
  func sectionController(
    _ sectionController: ListBindingSectionController<ListDiffable>,
    viewModelsFor object: Any) -> [ListDiffable] {
    guard let object = object as? Memo else { fatalError() }
    let results: [ListDiffable] = [
      MemoViewModel(id: object.memo_id, text: object.text, colorTheme: object.colorTheme)
    ]
    return results
  }
  func sectionController(
    _ sectionController: ListBindingSectionController<ListDiffable>,
    cellForViewModel viewModel: Any,
    at index: Int) -> UICollectionViewCell & ListBindable {

    let identifier: String
    switch viewModel {
    case is MemoViewModel:
      identifier = MemoViewCell.storyboardReuseableIdentifier
    default:
      identifier = MemoViewCell.storyboardReuseableIdentifier
    }
    guard let cell = collectionContext?
      .dequeueReusableCellFromStoryboard(withIdentifier: identifier, for: self, at: index)
      as? UICollectionViewCell & ListBindable
      else { fatalError("can't dequeueReusableCell identifier: [\(identifier)] index: \(index)") }
    return cell
  }
  func sectionController(
    _ sectionController: ListBindingSectionController<ListDiffable>,
    sizeForViewModel viewModel: Any,
    at index: Int) -> CGSize {
    guard let width = collectionContext?.containerSize.width else { return .zero }
    guard let height = collectionContext?.containerSize.height else { return .zero }
    switch viewModel {
    case is MemoViewModel:
      return CGSize(width: collectionContext!.containerSize.width, height: 55)
    default:
      return CGSize(width: width, height: height)
    }
  }
}
