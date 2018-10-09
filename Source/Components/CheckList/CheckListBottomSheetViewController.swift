//
//  CheckListBottomSheetViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import M13Checkbox
import ReactorKit
import RxDataSources
import RxSwift
import UIEmptyState
import UIKit

class CheckListBottomSheetViewController: UITableViewController, HasDisposeBag {
  var memo: Memo = Memo(text: "test")
  var dataSource: RxTableViewSectionedAnimatedDataSource<CheckListViewModel>?
  private let makeCheckItemFooterView = MakeCheckItemFooterView()
  private let makeCheckItemPublisher = PublishSubject<Memo>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(CheckItemTableCell.self, forCellReuseIdentifier: CheckItemTableCell.identifier)
    tableView.do {
      $0.separatorStyle = .none
      $0.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
      $0.rx.setDelegate(self).disposed(by: disposeBag)
    }
    self.emptyStateDataSource = self
    self.emptyStateDelegate = self
    self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    self.reloadEmptyState()
  }
  func makeCheckItem() {
    log.debug("Click makeCheckItem \(memo)")
    makeCheckItemPublisher.onNext(self.memo)
  }
}

extension CheckListBottomSheetViewController: View, StoryboardView {
  func bind(reactor: CheckListReactor) {
    self.rx.viewDidLoad
      .map { Reactor.Action.fetchMemo(memo: self.memo) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    makeCheckItemPublisher
      .map { _ in Reactor.Action.makeCheckItem(memo: self.memo) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    let dataSource = RxTableViewSectionedAnimatedDataSource<CheckListViewModel>(
      configureCell: configureCell
    )

    reactor.state.map { $0.checkListViewModels }
      .filterNil()
      .asDriver(onErrorJustReturn: [])
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
    reactor.state.map { $0.reloadEmptyView }
      .asDriver(onErrorJustReturn: false)
      .filter({ $0 })
      .drive(onNext: { [weak self] indexPath in
        guard let self = self else { return }
        self.reloadEmptyState()
      })
      .disposed(by: disposeBag)
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
      if cell.accessoryType == .checkmark {
        cell.accessoryType = .none
      } else {
        cell.accessoryType = .checkmark
      }
    }
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(Dimens.CheckList.itemHeight.rawValue)
  }
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return MakeCheckItemFooterView().then({
      $0.viewTapsGesture.rx.event.asDriver().drive(onNext: { [weak self] _ in
        guard let self = self else { return }
        self.makeCheckItem()
      }).disposed(by: disposeBag)
    })
  }
}

extension CheckListBottomSheetViewController {
  class func makeViewController(memo: Memo) -> CheckListBottomSheetViewController {
    return CheckListBottomSheetViewController().then({
      $0.memo = memo
    })
  }
}
