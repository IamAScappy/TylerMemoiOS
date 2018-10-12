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
  var colorThemeService: ColorThemeType!
  var memo: Memo!
  @IBOutlet weak var toolbar: UIToolbar!
  @IBOutlet weak var editView: UITextView!
  private lazy var colorThemeContainer: ColorThemeContainer = {
    let container = ColorThemeContainer()
    container.frame = CGRect(0, 0, self.view.frame.width, Dimens.AddMemo.colorThemeContainerHeight.rawValue)
    return container
  }()
  @IBOutlet weak private var colorThemeBarItem: UIBarButtonItem!
  @IBOutlet weak private var labelBarItem: UIBarButtonItem!
  @IBOutlet weak private var checkListBarItem: UIBarButtonItem!

  override func viewDidLoad() {
    super.viewDidLoad()
    enableMemoryLeakCheck(disposeBag)
    editView.inputAccessoryView = EditInputAccessoryView(frame: CGRect(0, 0, view.frame.width, Dimens.editAccessoryViewHeight.rawValue))
    self.navigationController?.navigationBar.backIndicatorImage = Asset.AddMemo.icBack.image
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    editView.keyboardDismissMode = .onDrag
    let panGesture = UIPanGestureRecognizer()
    editView.addGestureRecognizer(panGesture)
    panGesture.rx.event.asDriver().drive(onNext: { [weak self] panGesture in
      guard let self = self else { return }
      switch panGesture.state {
      case .began, .changed:
        break
      default: self.view.endEditing(true)
      }
    }).disposed(by: disposeBag)
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
        if isShow {
          func prepareShowAnimation() {
            self.colorThemeContainer.alpha = 0
            self.colorThemeContainer.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
          }
          self.colorThemeContainer.do {
            self.view.addSubview($0)
            $0.reactor = ColorThemeReactor(ColorThemeService())
            $0.transform = CGAffineTransform(translationX: 0, y: 100)
          }
          prepareShowAnimation()
          UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.colorThemeContainer.transform = CGAffineTransform(translationX: 0, y: self.toolbar.frame.origin.y - self.toolbar.frame.height)
            self.colorThemeContainer.alpha = 1
          })
        } else {
          self.colorThemeContainer.removeFromSuperview()
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
