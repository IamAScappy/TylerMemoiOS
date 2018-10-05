//
//  ColorTheme+DataSource.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 3..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxDataSources

extension ColorThemeContainer {
  var configureCell: (CollectionViewSectionedDataSource<ColorThemeModel>, UICollectionView, IndexPath, ColorTheme) -> UICollectionViewCell {
    return { dataSource, collectionView, indexPath, colorTheme in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorThemeCollectionCell.cellIdentifier, for: indexPath)
        as? ColorThemeCollectionCell
        else { fatalError("can't dequeueReusableCell identifier: [\(ColorThemeCollectionCell.cellIdentifier)] index: \(indexPath)") }
      return cell
    }
  }
}
