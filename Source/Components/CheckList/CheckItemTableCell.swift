//
//  CheckItemCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import M13Checkbox
import UIKit

class CheckItemTableCell: UITableViewCell, SwiftNameIdentifier, HasDisposeBag {
  private let checkTitle = UILabel()
  private let checkBox = M13Checkbox()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        let width = Dimens.CheckList.checkboxWidth.rawValue
        make.leading.equalToSuperview()
        make.top.equalToSuperview()
        make.width.equalTo(width)
        make.height.equalTo(width).multipliedBy(1)
      })
    }
    checkTitle.do {
      contentView.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.leading.equalTo(checkBox.snp.trailing).offset(15)
        make.centerY.equalTo(checkBox.snp.centerY)
      })
    }
    rx.observeWeakly(UITableViewCell.AccessoryType.self, #keyPath(UITableViewCell.accessoryType))
      .filterNil()
      .asDriver(onErrorJustReturn: .none)
      .drive(onNext: { [weak self] accessoryType in
        guard let self = self else { return }
        if accessoryType == .checkmark {
          self.checkBox.setCheckState(.checked, animated: true)
        } else {
          self.checkBox.setCheckState(.unchecked, animated: true)
        }
      })
      .disposed(by: disposeBag)
  }
}
extension CheckItemTableCell {
  func configCell(_ item: CheckItem) {
    self.checkTitle.text = item.name
  }
}
