//
//  AppDelegate+Realm.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 20..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

extension AppDelegate {
  func copyDefaultRealm() {
    let defaultURL = Realm.Configuration.defaultConfiguration.fileURL!
    if !FileManager.default.fileExists(atPath: defaultURL.absoluteString) {
      do {
        let replaceRealmURL = Bundle.main.url(forResource: "tyler-v1", withExtension: "realm")
        try FileManager.default.copyItem(at: replaceRealmURL!, to: defaultURL)
      } catch let error {
        print("error copying seeds: \(error)")
      }
    }
  }
}
