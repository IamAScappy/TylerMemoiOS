//
//  NibWithSwiftName.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 17..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

protocol NibWithSwiftName {
  static var nib: UINib { get }
}
extension NibWithSwiftName {
  static var nib: UINib {
    return UINib(nibName: String(describing: Self.self), bundle: nil)
  }
}
