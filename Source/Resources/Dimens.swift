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
  case endOfMargin = 15
  case editAccessoryViewHeight = 50
  enum CheckList: CGFloat, RawRepresentable {
    case itemHeight = 50
    case checkboxWidth = 30
    case betweenImageTitleSpacing = 15
  }
  enum AddMemo: CGFloat, RawRepresentable {
    case colorThemeContainerHeight = 70
  }
}
