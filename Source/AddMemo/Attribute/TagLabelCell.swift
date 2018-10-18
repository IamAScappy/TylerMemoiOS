//
//  TagCollectionCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

class TagLabelCell: UICollectionViewCell {
  private let tagLabel = PaddingLabel()
  var tagColor: UIColor = ColorName.tagBg
  var cornerRadius: CGFloat = 5
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private func initView() {
    tagLabel.do {
      self.contentView.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.edges.equalToSuperview()
      })
      $0.font = $0.font.withSize(Dimens.Common.labelFontSize.rawValue)
      $0.numberOfLines = 1
      $0.backgroundColor = tagColor
      $0.layer.cornerRadius = cornerRadius
      $0.layer.masksToBounds = true
      $0.textColor = UIColor.white
    }
  }
}

extension TagLabelCell {
  func configCell(_ label: Label) {
    tagLabel.text = label.title
  }
//  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//    setNeedsLayout()
//    layoutIfNeeded()
//    let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//    var newFrame = layoutAttributes.frame
//    newFrame.size.width = ceil(size.width)
//    newFrame.size.height = ceil(size.height)
//    layoutAttributes.frame = newFrame
//    return layoutAttributes
//  }
}
