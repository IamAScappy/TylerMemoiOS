//
//  Error.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

enum ApplicationError: Error {
  case empty
  
  var description: String {
    switch self {
    case .empty:
      return "empty"
    }
  }
  
}
