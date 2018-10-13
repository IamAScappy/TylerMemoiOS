//
//  UIView+VibrancyView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  func addVibrancyEffectView(blurAlpha: CGFloat = 0.8, addViewCall: (UIView) -> Void) {
    let blurEffect = UIBlurEffect(style: .extraLight)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.alpha = 0.8
    self.insertSubview(blurView, at: 0)
    blurView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
    blurView.contentView.addSubview(vibrancyView)
    vibrancyView.snp.makeConstraints { make in
      make.edges.equalTo(blurView.contentView)
    }
    addViewCall(vibrancyView.contentView)
  }
}
