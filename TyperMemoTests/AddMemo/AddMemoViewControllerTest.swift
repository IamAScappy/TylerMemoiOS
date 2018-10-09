//
//  AddMemoViewControllerTEst.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 10. 6..
//  Copyright © 2018년 tskim. All rights reserved.
//
import Nimble
import Quick
import XCTest
@testable import TyperMemo

class AddMemoViewControllerTest: QuickSpec {
  
  override func spec() {
    var expectMemo = Memo(text: "asd")
    var testViewController: AddMemoViewController!
    beforeEach {
      testViewController = AddMemoViewController.makeViewController(memo: expectMemo)
      testViewController.loadView()
      testViewController.viewDidLoad()
    }
    describe("AddMemoViewController") {
      it("asd", closure: {
        testViewController.colorTheme.sendActions(for: .touchUpInside)
        expect(testViewController.colorThemeContainer.isHidden) == true
      })
    }
  }
}


