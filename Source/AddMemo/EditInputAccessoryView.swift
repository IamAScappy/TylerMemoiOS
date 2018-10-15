//
//  EditInputAccessoryView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 12..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

internal class EditInputAccessoryView: UIView, HasDisposeBag {
  private let doneButton: UIButton = {
    let button = UIButton()
    button.setTitle(L10n.done, for: .normal)
    button.tintColor = ColorName.colorAccent
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func initView() {
    self.backgroundColor = .clear
    self.addVibrancyEffectView { vibrancyView in
      vibrancyView.addSubview(doneButton)
      doneButton.snp.makeConstraints { make in
        make.trailing.equalTo(vibrancyView).inset(15)
        make.centerY.equalTo(vibrancyView.snp.centerY)
      }
    }
    doneButton.rx.tap.asDriver().drive(onNext: { _ in
      KeyBoardHandler.dismissKeyboard()
    }).disposed(by: disposeBag)
  }
}
