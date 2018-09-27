//
//  Logger.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 27..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import XCGLogger

#if DEBUG
let log = XCGLogger.default
#else
let log = XCGLogger(identifier: "productLogger", includeDefaultDestinations: false)
#endif
func initLogger() {
  #if DEBUG
  log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true)
  #else
  log.setup(level: .severe, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true)
  #endif
}
