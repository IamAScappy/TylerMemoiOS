//
//  NSObject+Common.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardReuseableIndentifier {
  static var storyboardReuseableIdentifier: String { get }
}

extension StoryboardReuseableIndentifier where Self: UICollectionViewCell {
  static var storyboardReuseableIdentifier: String {
    return String(describing: Self.self)
  }
}
