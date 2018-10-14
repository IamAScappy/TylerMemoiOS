//
//  TagListView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

class TagListView: UIView {
  private lazy var collectionViewLayout = UICollectionViewFlowLayout()
  private lazy var uiCollectionView: UICollectionView = {
    return UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
