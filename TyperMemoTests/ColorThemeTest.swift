//
//  ColorThemeTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 16..
//  Copyright © 2018년 tskim. All rights reserved.
//
import Nimble
import Quick
import RxSwift
import RealmSwift
import Cuckoo
@testable import TyperMemo

class ColorThemeTest: QuickSpec {
  override func spec() {
    beforeSuite {
      try! FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
      RealmMigration.migrationRealm()
    }
    describe("ColorTheme") {
      var realm: Realm!
      beforeEach {
        realm = try! Realm()
      }
      it("초기 데이터가 존재해야함 ", closure: {
        expect(realm.objects(ColorTheme.self).count) == ColorThemeTemplate.all.count
      })
    }
  }
}

