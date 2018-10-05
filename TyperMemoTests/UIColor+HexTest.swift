//
//  UIColor+HexTest.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 10. 3..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Nimble
import Quick
@testable import TyperMemo

class UIColor_HexTest: QuickSpec {
  override func spec() {
    describe("UIColor+Hex") {
      it("convert hex string to UIColor", closure: {
        expect(UIColor(hexString: "#ffffff").toHexString()) == "#ffffff"
      })
    }
  }
}
