//
//  ViewController.swift
//
//

import UIKit
import RxSwift
import RealmSwift
import SnapKit
import Then
import IGListKit

class MainViewController: UIViewController {
  var data = [ListDiffable]()
  private let disposeBag = DisposeBag()
  @IBOutlet weak private var addMemoView: UIButton!
  @IBOutlet weak private var collectionView: UICollectionView!
  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.accessibilityIdentifier = "main"
    data.append(MemoViewModel(memos: [Memo(text: "abc"), Memo(text: "ddd"), Memo(text: "zzz")]))
    collectionView.do {
      $0.collectionViewLayout = UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = CGSize(width: 100, height: 40)
      })
    }
    addMemoView.do { view in
      if let data = NSDataAsset(name: "add_memo_svg")?.data {
        let svgLayer = CALayer(SVGData: data, completion: { svgLayer in
          svgLayer.fillColor = ColorName.colorAccent.cgColor
          svgLayer.resizeToFit(view.bounds)
        })
        view.layer.addSublayer(svgLayer)
      }
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
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
