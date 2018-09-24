//
//  CreateLabelViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
import ReactorKit
import RxSwift
import IGListKit
import RxOptional
// TODO Test1: navigation 에 searchController 나오는지
// TODO Test1: Label 검색 결과가 없을 때 Crete Label 이 생기는지 확인
class LabelViewController: UIViewController, StoryboardInitializable {
  @IBOutlet weak private var collectionView: UICollectionView!
  var disposeBag = DisposeBag()
  private var data: [ListDiffable] = []
  let searchController = UISearchController(searchResultsController: nil)
  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.searchController = searchController
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

extension LabelViewController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return data
  }
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return LabelSectionController()
  }
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
extension LabelViewController: View {
  func bind(reactor: LabelReactor) {
    self.rx.viewDidLoad
      .map { Reactor.Action.searchQuery(memoId: "", "") }
      .bind(to: reactor.action)
      .disposed(by: self.disposeBag)
    searchController.searchBar.rx.text
      .orEmpty
      .throttle(0.3, scheduler: MainScheduler.instance)
      .map { Reactor.Action.searchQuery(memoId: "", $0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    reactor.state.map { $0.sections }
      .filterNil()
      .withLatestFrom(reactor.state.map({ $0.keyword })
        .asDriver(onErrorJustReturn: "").filterNil(), resultSelector: { data, keyword in
        return (data, keyword)
      })
      .asDriver(onErrorJustReturn: ([], ""))
      .drive(onNext: { [weak self] data, keyword in
        if data.isEmpty {
          self?.data.append(NewLabelModel(title: keyword))
        } else {
          self?.data = data
        }
      })
      .disposed(by: disposeBag)
  }
}

extension LabelViewController {
  static func makeLabelViewController() -> LabelViewController {
    return LabelViewController.initFromStoryboard(name: "Label")
  }
}
