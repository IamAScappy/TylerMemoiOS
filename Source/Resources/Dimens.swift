//
//  Dimens.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
enum Dimens: CGFloat, RawRepresentable {
  case labelHeight = 40
  case editAccessoryViewHeight = 50
  enum CheckList: Int, RawRepresentable {
    case itemHeight = 50
    case checkboxWidth = 30
    case betweenImageTitleSpacing = 15
  }
}
