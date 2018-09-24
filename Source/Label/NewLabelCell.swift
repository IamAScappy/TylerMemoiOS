//
//  CreateLabellCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit
import IGListKit
import SwiftSVG

class NewLabelCell: UICollectionViewCell {
  private let addImageView: UIView = UIView()
  private let makeLabelTitleView: UILabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addImageView.do { imageView in
      self.addSubview(imageView)
      if let data = NSDataAsset(name: "ic_add_svg")?.data {
        let svgLayer = CALayer(SVGData: data, completion: { svgLayer in
          svgLayer.fillColor = ColorName.colorAccent.cgColor
          svgLayer.resizeToFit(imageView.bounds)
        })
        imageView.layer.addSublayer(svgLayer)
      }
      imageView.snp.makeConstraints({ make in
        let width = Dimens.labelHeight.rawValue - 2
        let ratio = 1
        make.leading.equalTo(self).offset(10)
        make.centerY.equalTo(self)
        make.width.equalTo(width)
        make.height.equalTo(imageView.snp.width).multipliedBy(ratio)
      })
    }
    makeLabelTitleView.do {
      self.addSubview($0)
      $0.snp.makeConstraints { make in
        make.leading.equalTo(addImageView.snp.trailing).offset(15)
        make.centerY.equalTo(self)
      }
    }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension NewLabelCell: ListBindable {
  func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? NewLabelModel else { return }
    makeLabelTitleView.text = viewModel.title
  }
}
