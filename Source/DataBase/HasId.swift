//
//  HasId.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 16..
//  Copyright © 2018년 tskim. All rights reserved.
//
import Foundation
import RealmSwift

protocol HasId: class {
  var id: String { get }
}
