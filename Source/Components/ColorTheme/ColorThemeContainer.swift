//
//  ColorThemeContainer.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 29..
//  Copyright © 2018년 tskim. All rights reserved.
//

import ReactorKit
import RealmSwift
import RxCocoa
import RxDataSources
import RxSwift
import UIKit

class ColorThemeContainer: UIView {
  private lazy var collectionViewLayout = UICollectionViewLayout()
  private lazy var uiCollectionView: UICollectionView = {
    return UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
  }()
  var disposeBag = DisposeBag()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initView()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }
  func initView() {
    uiCollectionView.do {
      addSubview($0)
      $0.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      $0.register(ColorThemeCollectionCell.self, forCellWithReuseIdentifier: ColorThemeCollectionCell.cellIdentifier)
      $0.dataSource = ColorThemeContainer.dataSource
    }
  }
}
extension ColorThemeContainer {
  static var dataSource = RxCollectionViewSectionedAnimatedDataSource<ColorThemeModel>(
    configureCell: { dataSource, collectionView, indexPath, row in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorThemeCollectionCell.cellIdentifier, for: indexPath)
      as? ColorThemeCollectionCell
        else { fatalError("can't dequeueReusableCell identifier: [\(ColorThemeCollectionCell.cellIdentifier)] index: \(indexPath)") }
      return cell
    })
}
extension ColorThemeContainer: View {
  func bind(reactor: ColorThemeReactor) {
    // in
    Observable.just(true)
      .map { _ in Reactor.Action.fetchColorThemes }
      .bind(to: reactor.action)
      .disposed(by: self.disposeBag)
    // out
    reactor.state.map { $0.error }
      .filterNil()
      .asDriver(onErrorJustReturn: NSError())
      .drive(onNext: { error in
        // TODO show error
      })
      .disposed(by: disposeBag)
    reactor.state.map { $0.isEmpty }
      .filterNil()
      .asDriver(onErrorJustReturn: false)
      .distinctUntilChanged()
      .filter({ $0 })
      .drive(onNext: { isEmpty in
        // TODO empty view
      })
      .disposed(by: disposeBag)
    reactor.state.map { $0.colorThemes }
      .filterNil()
      .distinctUntilChanged()
      .map({ _ in [ColorThemeModel(header: "asdasd", items: [])] })
      .asDriver(onErrorJustReturn: [])
      .drive(uiCollectionView.rx.items(dataSource: ColorThemeContainer.dataSource))
      .disposed(by: disposeBag)
  }
}
