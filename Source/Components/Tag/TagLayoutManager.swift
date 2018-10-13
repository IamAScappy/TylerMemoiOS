//
//  TagLayoutManager.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

class TagLayoutManager: NSLayoutManager {
  override func drawGlyphs(forGlyphRange glyphsToShow: NSRange, at origin: CGPoint) {
    let range = self.characterRange(forGlyphRange: glyphsToShow, actualGlyphRange: nil)
    guard let textStorage = textStorage else {
      return
    }
    textStorage
      .enumerateAttribute(
        NSAttributedString.Key.roundedBackgroundColor,
        in: range,
        options: .longestEffectiveRangeNotRequired) {
          value, range, objCBoolStop in
          guard let value = value else {
            super.drawGlyphs(forGlyphRange: range, at: origin)
            return
          }
          guard let color = (value as? UIColor) else { return }
          let glRange = glyphRange(forCharacterRange: range, actualCharacterRange: nil)
          //UInt here is because otherwise playground does not want to execute, although compiler
          //is actually letting me know that this is wrong. However, this makes the playground work
          //if it doesn't work for you, try removing UInt wrapping here.
          guard let tContainer = textContainer(forGlyphAt: glRange.location, effectiveRange: nil) else { return }
          //draw background rectangle
          guard let context = UIGraphicsGetCurrentContext() else { return }
          guard let font = currentFontFor(range: range) else { return }
          context.saveGState()
          context.translateBy(x: origin.x, y: origin.y)
          color.setFill()
          
          var rect = boundingRect(forGlyphRange: glRange, in: tContainer)
          rect.origin.x -= 5
          if rect.origin.y == 0 {
            rect.origin.y -= 1
          } else {
            rect.origin.y -= 2
          }
          rect.size.width += 10
          rect.size.height += 4
          let path = UIBezierPath(roundedRect: rect, cornerRadius: 6)
          path.fill()
          context.restoreGState()
          super.drawGlyphs(forGlyphRange: range, at: origin)
    }
  }
  
  func currentFontFor(range: NSRange) -> UIFont? {
    guard let textStorage = textStorage else {
      return nil
    }
    guard let font = textStorage.attributes(at: range.location, effectiveRange: nil)[NSAttributedString.Key.font] as? UIFont else { return nil }
    return font
  }
}
