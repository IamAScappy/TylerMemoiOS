//
//  MakeCheckItemFooterView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

class MakeCheckItemFooterCell: UICollectionViewCell {
  private let imageView = UIImageView()
  private let title = UILabel()
  let viewTapsGesture = UITapGestureRecognizer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private func initView() {
    self.addGestureRecognizer(viewTapsGesture)
    let tintColor = ColorName.checkListFooterTint
    imageView.do {
      $0.image = Asset.icAdd.image.withRenderingMode(.alwaysTemplate)
      $0.tintColor = tintColor
      contentView.addSubview($0)
      $0.snp.makeConstraints({ make in
        let width = Dimens.CheckList.checkSquareSize.rawValue
        make.leading.equalToSuperview().offset(20)
        make.centerY.equalToSuperview()
        make.width.equalTo(width)
        make.height.equalTo(width).multipliedBy(1)
      })
    }
    title.do {
      $0.textColor = tintColor
      contentView.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.leading.equalTo(imageView.snp.trailing).offset(Dimens.CheckList.betweenImageTitleSpacing.rawValue)
        make.centerY.equalTo(imageView.snp.centerY)
      })
      $0.text = L10n.makeCheckItemCaption
    }
  }
}
