//
//  MemoViewCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit
import PinterestLayout
import SnapKit
import UIKit

class MemoPreviewCell: UICollectionViewCell, SwiftNameIdentifier {
  private let memoText = UILabel()
  private let memoAttrViewController = MemoAttrViewController()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    memoText.do {
      contentView.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.leading.equalToSuperview()
        make.top.equalToSuperview()
      })
    }
    memoAttrViewController.do {
      contentView.addSubview($0.view)
      $0.view.snp.makeConstraints({ maker in
        maker.top.equalTo(memoText.snp.bottom)
        maker.bottom.equalToSuperview()
        maker.leading.equalToSuperview()
        maker.trailing.equalToSuperview()
      })
      $0.enableMakeCheckItemFooter = false
      $0.checkSquareSize = Dimens.Main.checkSquereSize.rawValue
      $0.reactor = MemoAttrReactor(MemoService())
    }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    super.apply(layoutAttributes)
    if let attributes = layoutAttributes as? PinterestLayoutAttributes {
      //change image view height by changing its constraint
      //      imageViewHeightLayoutConstraint.constant = attributes.imageHeight
    }
  }
}
extension MemoPreviewCell {
  func configCell(_ viewModel: MemoPreviewModel) {
    let memo = viewModel.memo
    memoText.text = memo.text
    memoAttrViewController.memo = memo
  }
}
//class MemoPreviewCell: UICollectionViewCell, SwiftNameIdentifier, NibWithSwiftName {
//  @IBOutlet weak var memoText: UILabel!
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//  }
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//  }
//  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
//    super.apply(layoutAttributes)
//    if let attributes = layoutAttributes as? PinterestLayoutAttributes {
//      //change image view height by changing its constraint
//      print("!!!!!!!!!! \(attributes.imageHeight)")
////      imageViewHeightLayoutConstraint.constant = attributes.imageHeight
//    }
//  }
//}
//
//extension MemoPreviewCell {
//  func configCell(_ viewModel: MemoPreviewModel) {
//    memoText.text = viewModel.text
//  }
//}
