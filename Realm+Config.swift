//
//  Realm+Config.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
  static var defaultReadOnlyConfiguration = Realm.Configuration(readOnly: true)
}
