//
//  AddMemoViewController.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 6..
//  Copyright © 2018년 tskim. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift
import UIKit

class AddMemoViewController: UIViewController, HasDisposeBag, StoryboardInitializable, DeallocationView {
  var colorThemeService: ColorThemeType!
  var memo: Memo!
  @IBOutlet weak private var toolbar: UIToolbar!
  @IBOutlet weak private var editView: UITextView!
  private lazy var colorThemeContainer: ColorThemeContainer = {
    let container = ColorThemeContainer()
    container.frame = CGRect(0, 0, self.view.frame.width, Dimens.AddMemo.colorThemeContainerHeight.rawValue)
    return container
  }()
  @IBOutlet weak private var closePanel: UIBarButtonItem!
  @IBOutlet weak private var colorThemeBarItem: UIBarButtonItem!
  @IBOutlet weak private var labelBarItem: UIBarButtonItem!
  @IBOutlet weak private var checkListBarItem: UIBarButtonItem!

  override func viewDidLoad() {
    super.viewDidLoad()
    enableMemoryLeakCheck(disposeBag)
    editView.inputAccessoryView = EditInputAccessoryView(frame: CGRect(0, 0, view.frame.width, Dimens.editAccessoryViewHeight.rawValue))
    self.navigationController?.navigationBar.backIndicatorImage = Asset.AddMemo.icBack.image
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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

    closePanel.rx.tap
      .map { Reactor.Action.allClosePanel }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    labelBarItem.rx.tap
      .map { Reactor.Action.viewLabel }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state
      .map { $0.isAllClosePanel }
      .asDriver(onErrorJustReturn: false)
      .filter { $0 }
      .drive()
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
        let position = CGPoint(x: self.view.frame.width, y: self.toolbar.frame.origin.y - Dimens.AddMemo.colorThemeContainerHeight.rawValue)
        if isShow {
          self.colorThemeContainer.do {
            self.view.addSubview($0)
            $0.reactor = ColorThemeReactor(ColorThemeService())
            self.colorThemeContainer.alpha = 0
            self.colorThemeContainer.transform = CGAffineTransform(translationX: position.x, y: position.y)
          }
          UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.colorThemeContainer.transform = CGAffineTransform(translationX: 0, y: position.y)
            self.colorThemeContainer.alpha = 1
          })
        } else {
          self.colorThemeContainer.animateLeftOut(endPosition: CGPoint(x: -self.view.frame.width, y: position.y))
        }
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

// TODO Layer 기반으로 애니메이션 객체를 생성하는 식으로 변경 필요
private extension ColorThemeContainer {
  func animateLeftOut(endPosition: CGPoint) {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
      self.transform = CGAffineTransform(translationX: endPosition.x, y: endPosition.y)
      self.alpha = 0
    }, completion: { _ in
      self.removeFromSuperview()
    })
  }
}
