//
//  ColoeThemeCollectionCell.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit

class ColorThemeCollectionCell: UICollectionViewCell {
  private let title = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    title.do {
      addSubview($0)
      $0.snp.makeConstraints({ make in
        make.edges.equalToSuperview()
      })
    }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ColorThemeCollectionCell {
  static var cellIdentifier: String = String(describing: self)
}
