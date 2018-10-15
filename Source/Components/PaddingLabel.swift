//
//  PaddingLabel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 14..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PaddingLabel: UILabel {
  @IBInspectable var topInset: CGFloat = 5.0
  @IBInspectable var bottomInset: CGFloat = 5.0
  @IBInspectable var leftInset: CGFloat = 7.0
  @IBInspectable var rightInset: CGFloat = 7.0

  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }

  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(
      width: size.width + leftInset + rightInset,
      height: size.height + topInset + bottomInset)
  }
}