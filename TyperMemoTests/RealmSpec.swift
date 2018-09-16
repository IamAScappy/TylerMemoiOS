//
//  RealmSpec.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 16..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Quick
import Nimble
import RealmSwift

class RealmSpec: QuickSpec {
  override func spec() {
    super.spec()
    
    beforeSuite {
      self.useTestDatabase()
    }
    
    beforeEach {
      self.clearDatabase()
    }
  }
}

extension RealmSpec {
  func useTestDatabase() {
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
  }
  
  func clearDatabase() {
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }
}
