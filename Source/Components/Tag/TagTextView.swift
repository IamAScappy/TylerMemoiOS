//
//  TagLabelView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

class TagTextView: UITextView {
  var tokens: [String]? {
    didSet {
      updateTag()
    }
  }

  var tagBackgroundColor: UIColor = ColorName.colorAccent

  override var intrinsicContentSize: CGSize {
    var intrinsicContentSize = self.contentSize
    intrinsicContentSize.width += (self.textContainerInset.left + self.textContainerInset.right) / 2.0
    intrinsicContentSize.height += (self.textContainerInset.top + self.textContainerInset.bottom) / 2.0
    return intrinsicContentSize
  }

  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    initView()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initView()
  }
  func initView() {
    isScrollEnabled = true
  }

  private func updateTag() {
    var delimiter = NSMutableAttributedString(string: "")
    let text = NSMutableAttributedString()

    let layoutManager = TagLayoutManager()
    textContainer.replaceLayoutManager(layoutManager)

    let paragraphStyle = NSMutableParagraphStyle()
    tokens?.forEach { token in
      let attrText = NSMutableAttributedString(string: token, attributes: [
          .roundedBackgroundColor: tagBackgroundColor,
          .foregroundColor: textColor ?? ColorName.white
        ])
      text.append(delimiter)
      text.append(attrText)
      delimiter = NSMutableAttributedString(string: "    ")
    }
    text.append(NSAttributedString(string: "\n"))
    let font = UIFont.systemFont(ofSize: 12)
    paragraphStyle.lineSpacing = 0.7 * font.lineHeight
    text.addAttribute(.paragraphStyle,
      value: paragraphStyle, range: NSRange(location: 0, length: text.length))
    attributedText = text
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    if self.bounds.size != self.intrinsicContentSize {
      self.invalidateIntrinsicContentSize()
    }
  }
}
