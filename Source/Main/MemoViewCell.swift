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
import SnapKit

class MemoViewCell: UICollectionViewCell {
  let preview: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    preview.do {
      contentView.addSubview($0)
      $0.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    setNeedsLayout()
    layoutIfNeeded()
    let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
    var newFrame = layoutAttributes.frame
    newFrame.size.width = ceil(size.width)
    newFrame.size.height = ceil(size.height)
    layoutAttributes.frame = newFrame
    return layoutAttributes
  }
}
