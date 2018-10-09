//
//  CheckListType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import Result
import RxRealm
import RxSwift

protocol CheckListType: RealmServiceType {
  func insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>
}

class CheckListService: CheckListType {
  func insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError> {
    return catchRealmBlock { realm in
      try realm.write {
        memo.checkList.append(checkItem)
      }
      return Result.success(memo)
    }
  }
}
