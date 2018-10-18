//
//  MemoFontFamilies.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 17..
//  Copyright © 2018년 tskim. All rights reserved.
//
import UIKit

enum MemoFontFamilies: String {
  case system
  case nanumSquare
  case nanumBarunPen
  case nanumPen
  case nanumGothic
  case nanumMyeongjo
  case nanumBrush
  case nanumBrushGothic
}

extension MemoFontFamilies {
  func font(fontSize: CGFloat) -> UIFont {
    switch self {
    case .system:
      return UIFont.systemFont(ofSize: fontSize)
    case .nanumBarunPen:
      return FontFamily.NanumBarunpen.regular.font(size: fontSize)
    case .nanumBrush:
      return FontFamily.NanumBrushScriptOTF.regular.font(size: fontSize)
    case .nanumBrushGothic:
      return FontFamily.NanumBarunGothicOTF.regular.font(size: fontSize)
    case .nanumPen:
      return FontFamily.NanumPenScriptOTF.regular.font(size: fontSize)
    case .nanumGothic:
      return FontFamily.NanumGothicOTF.regular.font(size: fontSize)
    case .nanumSquare:
      return FontFamily.NanumSquareOTF.regular.font(size: fontSize)
    case .nanumMyeongjo:
      return FontFamily.NanumMyeongjoOTF.regular.font(size: fontSize)
    }
  }
}
