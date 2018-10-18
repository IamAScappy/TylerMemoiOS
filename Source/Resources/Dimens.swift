//
//  Dimens.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
struct Dimens {
  enum Common: CGFloat {
    case labelHeight = 40
    case endOfMargin = 15
    case editAccessoryViewHeight = 50
    case memoFontSize = 20
    case labelFontSize = 12
    case checkItemFontSize = 13
  }
  
  
  enum CheckList: CGFloat {
    case itemHeight = 50
    case checkSquareSize = 30
    case checkCellHeight = 35
    case betweenImageTitleSpacing = 15
  }
  
  enum AddMemo: CGFloat {
    case colorThemeContainerHeight = 70
    case documentOfMargine = 15
  }
  
  enum Main: CGFloat {
    case checkSquereSize = 20
  }
}
