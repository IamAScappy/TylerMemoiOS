//
//  UIColor+Hex.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 17..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  func toRGBAString() -> String {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return String(
      format: "%02X%02X%02X%02X",
      Int(red * 0xff),
      Int(green * 0xff),
      Int(blue * 0xff),
      Int(alpha * 0xff)
    )
  }
  func toHexString() -> String {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return String(
      format: "%02X%02X%02X",
      Int(red * 0xff),
      Int(green * 0xff),
      Int(blue * 0xff)
    )
  }
}
