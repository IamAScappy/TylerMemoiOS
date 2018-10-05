//
//  String+Color.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 3..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

extension String {
  subscript (bounds: CountableClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start...end])
  }
  
  subscript (bounds: CountableRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start..<end])
  }
  func toColor() -> UIColor {
    return UIColor(hexString: self)
  }
}
