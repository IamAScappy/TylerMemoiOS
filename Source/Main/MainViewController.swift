//
//  ViewController.swift
//
//

import IGListKit
import RealmSwift
import RxSwift
import SnapKit
import Then
import UIKit
import ReactorKit
import Result
class MainViewController: UIViewController, DeallocationView, HasDisposeBag {
  var data = [MemoViewModel]()
  var disposeBag = DisposeBag()
  @IBOutlet weak private var addMemoView: UIButton!
  @IBOutlet weak private var collectionView: UICollectionView!
  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()

  override func awakeFromNib() {
//    viewDidLoad Bug
    self.rx.viewDidLoad.subscribe(onNext: { _ in }).disposed(by: disposeBag)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
//    TODO Remove test code
//    let service = MemoService()
//    let memo1 = Memo(text: "az")
//    memo1.checkList.append(CheckItem(name: "c1 \(Date())"))
//    memo1.checkList.append(CheckItem(name: "c2 \(Date())"))
//    memo1.labels.append(Label(title: "l1 \(Date())"))
//    memo1.labels.append(Label(title: "l2 \(Date())"))
//    service.insertMemos([
//      memo1
//      ])

    enableMemoryLeakCheck(disposeBag)
    collectionView.do {
      $0.collectionViewLayout = UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = CGSize(width: 100, height: 40)
      })
    }
    addMemoView.do { view in
      view.setImage(Asset.icEditView.image, for: .normal)
      view.accessibilityIdentifier = AccIdentifier.addMemoButton.rawValue
      view.rx.tap.asDriver().drive(onNext: { [weak self] _ in
        self?.show(LabelViewController.makeLabelViewController(), sender: self)
      }).disposed(by: disposeBag)
    }
    adapter.do {
      $0.dataSource = self
      $0.collectionView = collectionView
    }
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

extension MainViewController: View, StoryboardView {
  func bind(reactor: MemoListReactor) {
    self.rx.viewDidLoad
      .map { Reactor.Action.searchMemos(keyword: "") }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.error }
      .asDriver(onErrorJustReturn: nil)
      .filterNil()
      .drive(onNext: { error in
        // TODO Handle error
        log.error(error)
      })
      .disposed(by: disposeBag)
    
    reactor.state.map { $0.memos }
      .filterNil()
      .map({ memos in
        memos.toMemoViewModel()
      })
      .asDriver(onErrorJustReturn: nil)
      .filterNil()
      .drive(onNext: { [weak self] memos in
        guard let self = self else { return }
        log.info("drive \(memos)")
        self.data = memos
        self.adapter.performUpdates(animated: true)
      })
      .disposed(by: disposeBag)
  }
}
extension MainViewController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return data
  }
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return MemoSectionController()
  }
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}

private extension Array where Element: Memo {
  func toMemoViewModel() -> [MemoViewModel] {
    return self.map { memo in
      MemoViewModel(text: memo.text, labels: memo.labels.toArray(), checkItems: memo.checkList.toArray())
    }
  }
}
