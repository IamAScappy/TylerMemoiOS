//
//  RedButton.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 5..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

class RedButton: UIButton {
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder:aDecoder)
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOffset = CGSize(width: 2, height: 2)
    self.layer.shadowOpacity = 0.7
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = UIColor.red
  }
}
