//
//  LabelCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit
import IGListKit
class ExistLabelCell: UICollectionViewCell {
  private let label = UILabel()
  private let checkbox = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    label.do {
      self.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.leading.equalToSuperview()
        make.centerY.equalToSuperview()
      })
    }
    checkbox.do {
      self.addSubview($0)
      $0.snp.makeConstraints({ make in
//        let width = Dimens.labelHeight.rawValue
        make.trailing.equalToSuperview()
        make.centerY.equalToSuperview()
//        make.width.equalTo(width)
//        make.height.equalTo(width)
      })
    }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ExistLabelCell: ListBindable {
  func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? LabelViewModel else { return }
    label.text = viewModel.label
  }
}
