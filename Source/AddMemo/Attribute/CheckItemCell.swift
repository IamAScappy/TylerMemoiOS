//
//  CheckItemCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import M13Checkbox
import UIKit

class CheckItemCell: UICollectionViewCell, SwiftNameIdentifier, HasDisposeBag {
  private let checkTitle = UILabel()
  private let checkBox = M13Checkbox()

  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func initView() {
    checkBox.do {
      contentView.addSubview($0)
      $0.checkmarkLineWidth = 3
      $0.boxType = .square
      $0.stateChangeAnimation = .flat(.stroke)
      $0.snp.makeConstraints({ make in
        let width = Dimens.CheckList.checkSquareSize.rawValue
        make.leading.equalToSuperview()
        make.top.equalToSuperview()
        make.width.equalTo(width)
        make.height.equalTo(width).multipliedBy(1)
      })
    }
    checkTitle.do {
      contentView.addSubview($0)
      $0.font = $0.font.withSize(Dimens.Common.checkItemFontSize.rawValue)
      $0.snp.makeConstraints({ make in
        make.leading.equalTo(checkBox.snp.trailing)
        make.centerY.equalTo(checkBox.snp.centerY)
      })
    }
  }
}
extension CheckItemCell {
  func configCell(_ item: CheckItem, checkSquareSize: CGFloat) {
    self.checkTitle.text = item.name
    checkBox.do {
      $0.snp.updateConstraints({ maker in
        let width = checkSquareSize
        maker.width.equalTo(width)
        maker.height.equalTo(width).multipliedBy(1)
      })
    }
  }
}
