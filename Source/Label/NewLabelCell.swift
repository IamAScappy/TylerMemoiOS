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
import RxSwift

protocol NewLabelCellDelegate: class {
  func makeNewLabel(_ cell: NewLabelCell)
}

class NewLabelCell: UICollectionViewCell {
  private let makeLabelTitleView: UILabel = UILabel()
  private let taps = UITapGestureRecognizer()
  private let disposeBag = DisposeBag()
  weak var delegate: NewLabelCellDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addGestureRecognizer(taps)
    let addImageView = UIImageView(image: Asset.icAdd.image).then({ imageView in
      self.addSubview(imageView)
      imageView.contentMode = .scaleAspectFit
      imageView.snp.makeConstraints({ make in
        let width = Dimens.labelHeight.rawValue - 2
        let ratio = 1
        make.leading.equalTo(self)
        make.centerY.equalTo(self)
        make.width.equalTo(width)
        make.height.equalTo(imageView.snp.width).multipliedBy(ratio)
      })
    })
    addImageView.setNeedsLayout()
    makeLabelTitleView.do {
      self.addSubview($0)
      $0.snp.makeConstraints { make in
        make.leading.equalTo(addImageView.snp.trailing)
        make.centerY.equalTo(self)
      }
    }
    taps.rx.event.subscribe(onNext: { [weak self] _ in
      guard let `self` = self else { return }
      self.delegate?.makeNewLabel(self)
    }).disposed(by: disposeBag)
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
