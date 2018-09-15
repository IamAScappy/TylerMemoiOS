//
//  CheckItem.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class CheckItem: Object {
  @objc dynamic var name: String = ""
  @objc dynamic var done: Bool = false
}
