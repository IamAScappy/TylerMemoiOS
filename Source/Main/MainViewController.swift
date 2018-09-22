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

class MainViewController: UIViewController, ListAdapterDataSource {
  @IBOutlet weak private  var memoCollectionView: UICollectionView!
  var data = [ListDiffable]()
  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.accessibilityIdentifier = "main"
    memoCollectionView.collectionViewLayout = UICollectionViewFlowLayout().then({
      $0.estimatedItemSize = CGSize(width: 100, height: 40)
    })
    data.append(contentsOf: [Memo(text: "abc"), Memo(text: "ddd"), Memo(text: "zzz")])
    adapter.do {
      $0.dataSource = self
      $0.collectionView = memoCollectionView
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
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
