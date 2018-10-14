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

@IBDesignable
class ColorThemeContainer: UIView, HasDisposeBag {
  @IBInspectable open dynamic var spacing: CGFloat = 15
  private lazy var collectionViewLayout = UICollectionViewFlowLayout()
  private lazy var uiCollectionView: UICollectionView = {
    return UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
  }()
  
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
      self.addSubview($0)
      $0.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      $0.backgroundColor = ColorName.white
      $0.register(ColorThemeCollectionCell.self, forCellWithReuseIdentifier: ColorThemeCollectionCell.identifier)
    }
    collectionViewLayout.do {
      $0.scrollDirection = .horizontal
      $0.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
      $0.minimumLineSpacing = spacing
    }
  }
  func changedColorTheme(_ colorTheme: ColorTheme) {
    log.debug("changedColorTheme \(colorTheme)")
  }
  override func layoutSubviews() {
    let minWidth = max(self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height - spacing, 0)
    collectionViewLayout.estimatedItemSize = CGSize(minWidth, minWidth)
  }
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
        log.debug("The color themes error \(error)")
        // TODO show error
      })
      .disposed(by: disposeBag)
    reactor.state.map { $0.isEmpty }
      .filterNil()
      .asDriver(onErrorJustReturn: false)
      .distinctUntilChanged()
      .filter({ $0 })
      .drive(onNext: { isEmpty in
        log.debug("The color themes empty")
        // TODO empty view
      })
      .disposed(by: disposeBag)

    reactor.state.map { $0.colorThemes }
      .filterNil()
      .distinctUntilChanged()
      .asDriver(onErrorJustReturn: [])
      .drive(uiCollectionView.rx.items(cellIdentifier: ColorThemeCollectionCell.identifier, cellType: ColorThemeCollectionCell.self)) ({ row, element, cell in
        cell.configureCell(colorTheme: element)
        let tapGesture = UITapGestureRecognizer()
        cell.addGestureRecognizer(tapGesture)
        tapGesture.rx.event
          .asDriver()
          .drive(onNext: { [weak self] _ in
          guard let self = self else { return }
          self.changedColorTheme(element)
        }).disposed(by: cell.disposeBag)
      })
      .disposed(by: disposeBag)
  }
}
