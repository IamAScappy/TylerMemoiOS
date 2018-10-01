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
    let colorThemeContainer = ColorThemeContainer()
    colorThemeContainer.reactor = ColorThemeReactor(ColorThemeService())
    view.addSubview(colorThemeContainer)
    colorThemeContainer.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    // Do any additional setup after loading the view.
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
