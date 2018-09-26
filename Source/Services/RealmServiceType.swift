//
//  BaseServiceType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 26..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import Result
protocol RealmServiceType { }

extension RealmServiceType {
  func catchRealmBlock<T>(handle: (Realm) throws -> Result<T, NSError>) -> Result<T, NSError> {
    do {
      return try handle(try Realm())
    } catch let error as NSError {
      return Result.failure(error)
    }
  }
}
