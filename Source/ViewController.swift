//
//  ViewController.swift
//
//  Created by tskim on 2018. 9. 15..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit
import Then
import RealmSwift
import RxSwift
import SnapKit
class ViewController: UIViewController {
  
  var aaaaaa: NotificationToken!
  var sssss: NotificationToken!
  var realm = try? Realm()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
//    let colorThemeBlue = ColorThemeTemplate.blue
    let result = realm?.objects(ColorTheme.self)
//
//    result.addNotificationBlock
//    print("!!!! \(result)")
    
    UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100)).then({
      view.addSubview($0)
      $0.addTarget(self, action: #selector(aaa), for: .touchUpInside)
      $0.titleLabel?.text = "aaaa"
      $0.snp.makeConstraints({ make in
        make.center.equalToSuperview()
      })
    })
    
//    try? realm.write {
//      realm.add(colorThemeBlue, update: true)
//    }
//    realm.commitWrite()
//    print("!commitWrite")
    // Do any additional setup after loading the view, typically from a nib.
  }
  func aa(aa: RealmCollectionChange<AnyRealmCollection<ColorTheme>>) {
    
  }
  @objc func aaa() {
    try? realm?.write {
      realm?.add(ColorThemeTemplate.brown)
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
