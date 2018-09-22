//
//  MemoViewCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class MemoViewCell: UICollectionViewCell, ListBindable, StoryboardReuseableIndentifier {
  @IBOutlet weak private var text: UILabel!
  @IBOutlet weak private var labels: UILabel!

  func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? MemoViewModel else { return }
    text.text = viewModel.text
  }
}
