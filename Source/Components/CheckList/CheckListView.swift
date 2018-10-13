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
import UIKit

class CheckListView: UIView, HasDisposeBag {
  var memo: Memo = Memo(text: "test")

  private let tableView = UITableView()
  private let makeCheckItemFooterView = MakeCheckItemFooterView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initView()
  }

  func initView() {
    tableView.do {
      self.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.edges.equalToSuperview()
      })
      $0.separatorStyle = .none
      $0.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
      $0.rx.setDelegate(self).disposed(by: disposeBag)
      $0.register(CheckItemTableCell.self, forCellReuseIdentifier: CheckItemTableCell.identifier)
    }
  }
}

extension CheckListView: View, StoryboardView {
  func bind(reactor: CheckListReactor) {
    Observable.just(true)
      .map { _ in Reactor.Action.fetchMemo(memo: self.memo) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    makeCheckItemFooterView.viewTapsGesture.rx.event
      .map { _ in Reactor.Action.makeCheckItem(memo: self.memo) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    let dataSource = RxTableViewSectionedAnimatedDataSource<CheckListViewModel>(
      configureCell: configureCell
    )
    reactor.state.map { $0.checkListViewModels }
      .asDriver(onErrorJustReturn: [])
      .filterNil()
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

extension CheckListView: UITableViewDelegate {
  class func makeViewController(memo: Memo) -> CheckListView {
    return CheckListView().then({
      $0.memo = memo
    })
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
      if cell.accessoryType == .checkmark {
        cell.accessoryType = .none
      } else {
        cell.accessoryType = .checkmark
      }
    }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Dimens.CheckList.itemHeight.rawValue
  }
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return makeCheckItemFooterView
  }
}
