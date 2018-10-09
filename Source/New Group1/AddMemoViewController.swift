//
//  AddMemoViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 6..
//  Copyright © 2018년 tskim. All rights reserved.
//

import ReactorKit
import RxSwift
import UIKit

class AddMemoViewController: UIViewController, HasDisposeBag, StoryboardInitializable, DeallocationView {
  var memo: Memo!
  let colorThemeContainer = ColorThemeContainer()
  @IBOutlet weak private var colorThemeBarItem: UIBarButtonItem!
  @IBOutlet weak private var labelBarItem: UIBarButtonItem!
  @IBOutlet weak private var checkListBarItem: UIBarButtonItem!

  override func viewDidLoad() {
    super.viewDidLoad()
    enableMemoryLeakCheck(disposeBag)
    self.navigationController?.navigationBar.backIndicatorImage = Asset.AddMemo.icBack.image
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    colorThemeContainer.do {
      view.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.leading.equalToSuperview()
        make.top.equalToSuperview().offset(100)
        make.trailing.equalToSuperview()
        make.height.equalTo(40)
      })
    }
    colorThemeContainer.reactor = ColorThemeReactor(ColorThemeService())
  }
}
extension AddMemoViewController: StoryboardView {
  func bind(reactor: AddMemoReactor) {
    self.rx.viewDidLoad
      .map { Reactor.Action.loadedMemoView(memo: self.memo) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    colorThemeBarItem.rx.tap
      .map { Reactor.Action.toggleColorTheme }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    labelBarItem.rx.tap
      .map { Reactor.Action.viewLabel }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state
      .map { $0.isShowLabel }
      .filter({ $0 })
      .asDriver(onErrorJustReturn: false)
      .drive(onNext: { [weak self] isShow in
        guard let self = self else { return }
        self.show(LabelViewController.makeLabelViewController(), sender: self)
      })
      .disposed(by: disposeBag)

    reactor.state
      .map { $0.isShowColorTheme }
      .asDriver(onErrorJustReturn: false)
      .drive(onNext: { [weak self] isShow in
        guard let self = self else { return }
        self.colorThemeContainer.isHidden = !isShow
      })
      .disposed(by: disposeBag)
  }
}

extension AddMemoViewController {
  class func makeViewController(memo: Memo) -> AddMemoViewController {
    return AddMemoViewController.initFromStoryboard(name: "AddMemo").then({
      $0.memo = memo
    })
  }
}
