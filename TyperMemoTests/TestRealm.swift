//
//  TestRealm.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 20..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
@testable import TyperMemo

class TestRealm: MyRealm {
  class override func realm() throws -> Realm {
    return try Realm(configuration: MyRealm.config)
  }
}
