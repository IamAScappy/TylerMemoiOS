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
  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.estimatedItemSize = CGSize(width: 100, height: 40)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = UIColor(red: 0.831_372_549, green: 0.945_098_039, blue: 0.964_705_882, alpha: 1)
    return collectionView
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    performSegue(withIdentifier: "label", sender: self)
    view.addSubview(collectionView)
    view.accessibilityIdentifier = "main"
    data.append(MemoViewModel(memos: [Memo(text: "abc"), Memo(text: "ddd"), Memo(text: "zzz")]))
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
    //TODO: implement emptyview
    return nil
  }
}
