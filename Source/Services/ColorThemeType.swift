//
//  ColorThemeType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import Result
import RxRealm
import RxSwift

protocol ColorThemeType: RealmServiceType {
  func getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>
}

class ColorThemeService: ColorThemeType {
  func getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError> {
    let results = catchRealmBlock { realm -> Result<Results<ColorTheme>, NSError> in
      let results = realm.objects(ColorTheme.self)
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
