//
//  TestUtils.swift
//  TyperMemoTests
//
//  Created by tskim on 2018. 10. 14..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
@testable import TyperMemo

class TestUtils {
  static func generateMemo(count: Int = 5) -> [Memo] {
    let service = MemoService()
    let memos = Array(0..<count).map { index in
      Memo(text: "\(index + 1)")
    }
    service.insertMemos(memos)
    return memos
  }
}
