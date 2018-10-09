//
//  CreateLabelViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit
import ReactorKit
import RxCocoa
import RxOptional
import RxSwift
import UIKit

// TODO Test1: navigation 에 searchController 나오는지
// TODO Test1: Label 검색 결과가 없을 때 Crete Label 이 생기는지 확인
class LabelViewController: UIViewController, StoryboardInitializable, DeallocationView, HasDisposeBag {
  @IBOutlet weak private var collectionView: UICollectionView!
  private var data: [ListDiffable] = []
  let searchController = UISearchController(searchResultsController: nil)
  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()
  private let newLabelSelectedPublisher = PublishSubject<Int>()

  override func viewDidLoad() {
    super.viewDidLoad()
    enableMemoryLeakCheck(disposeBag)
    self.navigationItem.do {
      $0.searchController = searchController
      $0.hidesSearchBarWhenScrolling = false
    }
    self.searchController.do {
      $0.dimsBackgroundDuringPresentation = false
    }
    collectionView.do {
      $0.collectionViewLayout = UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = CGSize(width: 100, height: 40)
      })
    }
    adapter.do {
      $0.collectionView = collectionView
      $0.dataSource = self
    }
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

extension LabelViewController: ListAdapterDataSource, NewLabelSectionDelegate {
  func newLabelSection(index: Int) {
    newLabelSelectedPublisher.onNext(index)
  }
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return data
  }
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return LabelSectionController().then({
      $0.newLabelSectionDelegate = self
    })
  }
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
extension LabelViewController: View {
  func bind(reactor: LabelReactor) {
//    In bind
    let searchKeywordChange = searchController.searchBar.rx.text
      .orEmpty
      .throttle(0.5, latest: true, scheduler: MainScheduler.asyncInstance)
    self.rx.viewDidLoad
      .map { Reactor.Action.searchQuery(memoId: "", "") }
      .bind(to: reactor.action)
      .disposed(by: self.disposeBag)
    searchKeywordChange
      .map { Reactor.Action.searchQuery(memoId: "", $0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    newLabelSelectedPublisher
      .withLatestFrom(searchKeywordChange)
      .map({ Reactor.Action.createLabel(Label(title: $0)) })
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
//    Out bind
    reactor.state.map { $0.sections }
      .filterNil()
      .asDriver(onErrorJustReturn: ([]))
      .drive(onNext: { [weak self] data in
        guard let `self` = self else { return }
        self.data = data
        self.adapter.performUpdates(animated: true)
      })
      .disposed(by: disposeBag)

    reactor.state.map { $0.isEmpty }
      .filterNil()
      .asDriver(onErrorJustReturn: false)
      .filter { $0 }
      .map({ [weak self] _ in
        return self?.searchController.searchBar.text ?? ""
      })
      .filterEmpty()
      .drive(onNext: { [weak self] keyword in
        guard let `self` = self else { return }
        let newLabel = NewLabelModel(title: keyword)
        self.data.append(newLabel)
        self.adapter.performUpdates(animated: true)
      })
      .disposed(by: disposeBag)
  }
}

extension LabelViewController {
  static func makeLabelViewController() -> LabelViewController {
    return LabelViewController.initFromStoryboard(name: "Label").then({ _ in
    })
  }
}
