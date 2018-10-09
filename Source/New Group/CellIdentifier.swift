//
//  CellIdentifier.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

protocol SwiftNameIdentifier {
  static var identifier: String { get }
}
extension SwiftNameIdentifier {
  static var identifier: String {
    return String(describing: Self.self)
  }
}
