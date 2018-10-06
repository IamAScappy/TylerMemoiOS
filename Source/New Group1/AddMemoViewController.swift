//
//  AddMemoViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 6..
//  Copyright © 2018년 tskim. All rights reserved.
//

import ReactorKit
import UIKit
import RxSwift

class AddMemoViewController: UIViewController, HasDisposeBag, StoryboardInitializable {
  @IBOutlet weak private var colorTheme: UIButton!
  var memo: Memo!
  let colorThemeContainer = ColorThemeContainer()

  override func viewDidLoad() {
    super.viewDidLoad()
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
    
    colorTheme.rx.tap
      .map { Reactor.Action.toggleColorTheme }
      .bind(to: reactor.action)
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
