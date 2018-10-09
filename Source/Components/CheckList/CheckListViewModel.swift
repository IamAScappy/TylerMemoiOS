//
//  CheckListModel.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxDataSources

struct CheckListViewModel {
  var header: String
  var items: [Item]
}

extension CheckListViewModel: AnimatableSectionModelType {
  typealias Item = CheckItem
  
  var identity: String {
    return header
  }
  
  init(original: CheckListViewModel, items: [Item]) {
    self = original
    self.items = items
  }
}

extension CheckItem: IdentifiableType {
  var identity: String {
    return self.name
  }
}
