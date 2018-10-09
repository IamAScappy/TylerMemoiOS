//
//  EmptyView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

struct EmptyViewModel {
  let image: UIImage
  let title: String
  let buttonText: String
}
class EmptyView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  convenience init(model: EmptyViewModel) {
    self.init(frame: .zero)
  }
  private func initView() {
    
  }
}
