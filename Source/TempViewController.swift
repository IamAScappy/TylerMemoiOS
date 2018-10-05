//
//  TempViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit

class TempViewController: UIViewController {
  let colorThemeContainer = ColorThemeContainer()
  @IBOutlet weak var button: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    colorThemeContainer.do {
      view.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.leading.equalToSuperview()
        make.top.equalToSuperview().offset(100)
        make.trailing.equalToSuperview()
        make.height.equalTo(40)
      })
    }
    colorThemeContainer.reactor = ColorThemeReactor(ColorThemeService())
    button.addTarget(self, action: #selector(aa), for: .touchUpInside)
    // Do any additional setup after loading the view.
  }
  @objc func aa() {
    colorThemeContainer.isHidden = !colorThemeContainer.isHidden
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
