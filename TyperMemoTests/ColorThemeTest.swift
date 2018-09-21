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


class ColorThemeTest: RealmSpec {
  override func spec() {
    describe("ColorTheme") {
      var realm: Realm!
      beforeEach {
        realm = try! Realm()
      }
      it("init data ", closure: {
        let realmValue = FakeRealmCollectionValue<ColorTheme>()
        let result = realm.objects(ColorTheme.self)
        try! realm.write {
          realm.add(ColorThemeTemplate.brown, update: true)
        }
//        expect(realmValue.count).toEventually(equal(3))
      })
    }
  }
}

