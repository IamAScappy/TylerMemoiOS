//
//  AppDelegate+Realm.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 20..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMigration {
  static func migrationRealm() {
    let defaultURL = Realm.Configuration.defaultConfiguration.fileURL!
    let defaultParentURL = defaultURL.deletingLastPathComponent()
    let tylerURL = defaultParentURL.appendingPathComponent("tyler-v1.realm")
    
    if !FileManager.default.fileExists(atPath: tylerURL.absoluteString),
      let v1URL = Bundle.main.url(forResource: "tyler-v1", withExtension: "realm") {
      
      do {
//        try FileManager.default.removeItem(at: defaultURL)
        try FileManager.default.copyItem(at: v1URL, to: tylerURL)
      } catch let error {
        print("error copying seeds: \(error)")
      }
      let migrationBlock: MigrationBlock = { migration, oldSchemaVersion in }
      Realm.Configuration.defaultConfiguration = Realm.Configuration(fileURL: tylerURL, schemaVersion: 1, migrationBlock: migrationBlock)
    }
  }
}
