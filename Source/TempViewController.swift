//
//  TempViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit
class TempViewController: UIViewController {
  private let label = UILabel()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    label.text = "abc한글이"
    let font = UIFont(font: FontFamily.NanumPenScriptOTF.regular, size: 20.0) // iOS
    let hhh = "abc한글이".heightForWidth(width: 1000, font: font!)
  }
}
