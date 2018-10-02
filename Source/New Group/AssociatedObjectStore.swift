//
//  AssociatedObjectStore.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 2..
//  Copyright © 2018년 tskim. All rights reserved.
//

import ObjectiveC

public protocol AssociatedObjectStore {
}

extension AssociatedObjectStore {
  func associatedObject<T>(forKey key: UnsafeRawPointer) -> T? {
    return objc_getAssociatedObject(self, key) as? T
  }
  
  func associatedObject<T>(forKey key: UnsafeRawPointer, default: @autoclosure () -> T) -> T {
    if let object: T = self.associatedObject(forKey: key) {
      return object
    }
    let object = `default`()
    self.setAssociatedObject(object, forKey: key)
    return object
  }
  
  func setAssociatedObject<T>(_ object: T?, forKey key: UnsafeRawPointer) {
    objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
}
