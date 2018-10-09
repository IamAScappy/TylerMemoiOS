//
//  Dimens.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

enum Dimens: Int, RawRepresentable {
  case labelHeight = 40
  
  enum CheckList: Int, RawRepresentable {
    case itemHeight = 50
    case checkboxWidth = 30
    case betweenImageTitleSpacing = 15
  }
}
