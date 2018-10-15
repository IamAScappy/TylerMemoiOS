//
//  LabelTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 16..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Nimble
import Quick
import RealmSwift
@testable import TyperMemo

class LabelTest: RealmSpec {
  override func spec() {
    var realm: Realm!
    describe("Label") {
      beforeEach {
        realm = try! Realm()
      }
      it("list of label with isChecked", closure: {
        let memo = Memo(text: "abc")
        let labels = (0...5).map({
          return Label(value: ["title": "\($0)"])
        })
        memo.labels.append(labels.first!)
        try! realm.write {
          realm.add(memo)
          realm.add(labels)
        }
        expect(labels[0].isLinkingMemo(memo_id: memo.memo_id)) == true
        expect(labels[1].isLinkingMemo(memo_id: memo.memo_id)) == false
        expect(labels[4].isLinkingMemo(memo_id: memo.memo_id)) == false
      })
    }
  }
}
