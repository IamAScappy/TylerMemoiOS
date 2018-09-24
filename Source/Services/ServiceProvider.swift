//
//  ServiceProvider.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

protocol ServiceProviderType: class {
  var memoService: MemoServiceType { get }
  var labelService: LabelServiceType { get }
}

class ServiceProvider: ServiceProviderType {
  var memoService: MemoServiceType = MemoService()
  var labelService: LabelServiceType = LabelService()
}
