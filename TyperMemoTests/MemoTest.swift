//
//  MemoTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 9. 16..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Nimble
import Quick
import RealmSwift

@testable import TyperMemo
class MemoTest: RealmSpec {
  override func spec() {
    var realm: Realm!
    describe("Memo") {
      beforeEach {
        realm = try! Realm()
      }
      it("insert a memos", closure: {
        let memo = Memo(value: ["text": "1"])
        let memo2 = Memo(value: ["text": "1"])
        try! realm.write {
          realm.add(memo)
          realm.add(memo2)
        }
      })
      it("insert a memo with labels", closure: {
        let memo1 = Memo(value: ["text": "1"])
        let memo2 = Memo(value: ["text": "2"])

        let label1 = Label(value: ["title": "1"])
        let label2 = Label(value: ["title": "2"])
        memo1.labels.append(objectsIn: [label1, label2])

        try! realm.write {
          realm.add(memo1)
        }
        expect(memo1.labels.first?.ownerMemos.count) == 1
        expect(memo1.labels.first?.ownerMemos.first) == memo1

        memo2.labels.append(objectsIn: [label1])
        try! realm.write {
          realm.add(memo2)
        }
        expect(label1.ownerMemos.count) == 2
        expect(label2.ownerMemos.count) == 1
      })
    }
  }
}
