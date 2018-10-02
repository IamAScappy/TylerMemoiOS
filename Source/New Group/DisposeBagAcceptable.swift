//
//  DisposeBagAcceptable.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 2..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol DisposeBagAcceptable {
  var disposeBag: DisposeBag { get }
}
