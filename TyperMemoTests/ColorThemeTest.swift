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
@testable import TyperMemo

class ColorThemeTest: RealmSpec {
  override func spec() {
    describe("ColorTheme") {
      var realm: Realm!
      beforeEach {
        realm = try! Realm()
      }
      it("init data", closure: {
          let result = realm.objects(ColorTheme.self)
        print("!!!!!! \(result)")
      })
    }
  }
}

