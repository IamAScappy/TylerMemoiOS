//
//  CheckListBottomSheetViewController+EmptyState.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
import UIEmptyState

extension CheckListBottomSheetViewController: UIEmptyStateDelegate, UIEmptyStateDataSource {
  var emptyStateImage: UIImage? {
    return UIImage.gifImageWithName("empty_check_list")
  }
  var emptyStateTitle: NSAttributedString {
    let attrs = [NSAttributedString.Key.foregroundColor: ColorName.checkListFooterTint,
                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)]
    return NSAttributedString(string: L10n.checkListEmptyTitle, attributes: attrs)
  }
  var emptyStateButtonSize: CGSize? {
    return CGSize(width: 100, height: 40)
  }
  var emptyStateButtonTitle: NSAttributedString? {
    let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
    return NSAttributedString(string: L10n.makeCheckItemCaption, attributes: attrs)
  }
  
  func emptyStateViewWillShow(view: UIView) {
    guard let emptyView = view as? UIEmptyStateView else { return }
    // Some custom button stuff
    emptyView.button.layer.cornerRadius = 5
    emptyView.button.layer.borderWidth = 1
    emptyView.button.layer.borderColor = UIColor.red.cgColor
    emptyView.button.layer.backgroundColor = UIColor.red.cgColor
  }
  func emptyStatebuttonWasTapped(button: UIButton) {
    self.makeCheckItem()
  }
}
