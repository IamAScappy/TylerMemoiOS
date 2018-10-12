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
    
    let blurEffect = UIBlurEffect(style: .extraLight)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.alpha = 0.8
    blurView.translatesAutoresizingMaskIntoConstraints = false
    self.insertSubview(blurView, at: 0)
    blurView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
    vibrancyView.translatesAutoresizingMaskIntoConstraints = false
    vibrancyView.contentView.addSubview(doneButton)
    blurView.contentView.addSubview(vibrancyView)
    
    vibrancyView.snp.makeConstraints { make in
      make.edges.equalTo(blurView.contentView)
    }
    
    doneButton.snp.makeConstraints { make in
      make.trailing.equalTo(vibrancyView.contentView).inset(15)
      make.centerY.equalTo(vibrancyView.snp.centerY)
    }
    doneButton.rx.tap.asDriver().drive(onNext: { _ in
      KeyBoardHandler.dismissKeyboard()
    }).disposed(by: disposeBag)
  }
}
