//
//  MemoServiceType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import Result
import RxSwift

protocol MemoServiceType: RealmServiceType {
  func getMemoOrDefault(_ defaultMemo: Memo) -> Result<Observable<Memo>, NSError>
  func searchMemos(_ keyword: String) -> Result<Observable<[Memo]>, NSError>
  func insertMemo(_ memo: Memo) -> Result<String, NSError>
  func insertMemos(_ memos: [Memo]) -> Result<[String], NSError>
}

class MemoService: MemoServiceType {
  func insertMemos(_ memos: [Memo]) -> Result<[String], NSError> {
    return catchRealmBlock { realm in
      try realm.write {
        realm.add(memos)
      }
      return Result.success(memos.map({ $0.memo_id }))
    }
  }
  func insertMemo(_ memo: Memo) -> Result<String, NSError> {
    return catchRealmBlock { realm in
      try realm.write {
        realm.add(memo)
      }
      return Result.success(memo.memo_id)
    }
  }
  func getMemoOrDefault(_ defaultMemo: Memo) -> Result<Observable<Memo>, NSError> {
    let results = catchRealmBlock { realm -> Result<Results<Memo>, NSError> in
      let results = realm.objects(Memo.self).filter("\(Memo.primaryKey()) == \(defaultMemo.memo_id)")
      return Result.success(results)
    }
    switch results {
    case let .failure(error):
      return Result.failure(error)
    case .success(let value):
      let observableMemo = Observable.collection(from: value).map { results -> Memo in
        guard let memo = results.last else { return defaultMemo }
        return memo
      }
      return Result.success(observableMemo)
    }
  }
  func searchMemos(_ keyword: String) -> Result<Observable<[Memo]>, NSError> {
    let results = catchRealmBlock { realm -> Result<Results<Memo>, NSError> in
      let results = realm.objects(Memo.self).filter("text Like '*\(keyword)*'")
      return Result.success(results)
    }
    switch results {
    case let .failure(error):
      return Result.failure(error)
    case .success(let value):
      let data = Observable.collection(from: value).map { $0.toArray() }
      return Result.success(data)
    }
  }
}
