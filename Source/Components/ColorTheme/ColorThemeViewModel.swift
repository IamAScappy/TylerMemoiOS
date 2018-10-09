//
//  ColorThemeModel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxDataSources

struct ColorThemeViewModel {
  var header: String
  var items: [Item]
}

extension ColorThemeViewModel: AnimatableSectionModelType {
  typealias Item = ColorTheme
  
  var identity: String {
    return header
  }

  init(original: ColorThemeViewModel, items: [ColorTheme]) {
    self = original
    self.items = items
  }
}

extension ColorTheme: IdentifiableType {
  var identity: String {
    return self.color_theme_id
  }
}
