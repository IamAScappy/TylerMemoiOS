//
//  TempViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit
class TempViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let tagLabeView = TagTextView()
    view.addSubview(tagLabeView)
    tagLabeView.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(100)
    }
    tagLabeView.textColor = ColorName.white
    tagLabeView.tokens = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen"]
  }
}
