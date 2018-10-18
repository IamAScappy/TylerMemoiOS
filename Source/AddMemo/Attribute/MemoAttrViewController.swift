//
//  MemoAttributeView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 13..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit
import UIKit
import ReactorKit
import RxSwift

class MemoAttrViewController: UIViewController, HasDisposeBag, DeallocationView {
  @objc dynamic var memo: Memo?
  var enableMakeCheckItemFooter = true
  var checkSquareSize = Dimens.CheckList.checkSquareSize.rawValue
  
  private lazy var collectionViewLayout = UICollectionViewFlowLayout()
  private lazy var uiCollectionView: UICollectionView = {
    collectionViewLayout.estimatedItemSize = CGSize(width: 100, height: 40)
    return UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
  }()
  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()
  private var data: [ListDiffable]?
  private let createNewCheckItemPublisher = PublishSubject<Bool>()

  override func awakeFromNib() {
    //    viewDidLoad Bug
    self.rx.viewDidLoad.subscribe(onNext: { _ in }).disposed(by: disposeBag)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    enableMemoryLeakCheck(disposeBag)
    initView()
  }

  func initView() {
    uiCollectionView.do {
      self.view.addSubview($0)
      $0.backgroundColor = UIColor.white
    }
    adapter.do {
      $0.dataSource = self
      $0.collectionView = uiCollectionView
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    uiCollectionView.frame = view.bounds
  }
}

extension MemoAttrViewController: View, StoryboardView {
  func bind(reactor: MemoAttrReactor) {
    self.rx.observe(Memo.self, #keyPath(memo))
      .filterNil()
      .map { Reactor.Action.loadedMemo($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    createNewCheckItemPublisher
      .map { _ in Reactor.Action.makeCheckItem }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.error }
      .asDriver(onErrorJustReturn: nil)
      .filterNil()
      .drive(onNext: { error in
        log.error(error)
        // TODO Error
      })
      .disposed(by: disposeBag)
    
    reactor.state.map { $0.memo }
      .asDriver(onErrorJustReturn: nil)
      .filterNil()
      .drive(onNext: { [weak self] memo in
        guard let self = self else { return }
        log.debug("\(String(describing: memo))")
        self.data = memo.toListViewModel(checkBoxWidth: self.checkSquareSize)
        self.adapter.performUpdates(animated: true, completion: nil)
      })
      .disposed(by: disposeBag)
  }
}
extension MemoAttrViewController: ListAdapterDataSource, CheckListSectionControllerDelegate {
  func createNewCheckItem() {
    log.debug("create check item")
    createNewCheckItemPublisher.onNext(true)
  }

  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return data ?? []
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    switch object {
    case is LabelViewItem: return LabelListSectionController()
    case is CheckItemModel: return CheckListSectionController(enableMakeCheckItemFooter: self.enableMakeCheckItemFooter).then({
      $0.delegate = self
    })
    default: fatalError()
    }
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
   return nil
  }
}

private extension Memo {
  func toListViewModel(checkBoxWidth: CGFloat) -> [ListDiffable] {
    return [
      CheckItemModel(items: self.checkList.toArray(), checkBoxWidth: checkBoxWidth),
      LabelViewItem(items: self.labels.toArray())
    ]
  }
}
