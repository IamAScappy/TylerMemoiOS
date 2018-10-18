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
import RxDataSources
import PinterestLayout

class MainViewController: UIViewController, DeallocationView, HasDisposeBag {
  var data = [MemoPreviewModel]()
  var disposeBag = DisposeBag()
//  @IBOutlet weak private var addMemoView: UIButton!
  private lazy var collectionViewLayout = PinterestLayout()
  private lazy var uiCollectionView: UICollectionView = {
    collectionViewLayout.delegate = self
    collectionViewLayout.cellPadding = 5
    collectionViewLayout.numberOfColumns = 2
    return UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
  }()
//  @IBOutlet weak private var collectionView: UICollectionView!
//  lazy var adapter: ListAdapter = { return ListAdapter(updater: ListAdapterUpdater(), viewController: self) }()

  override func awakeFromNib() {
//    viewDidLoad Bug
    self.rx.viewDidLoad.subscribe(onNext: { _ in }).disposed(by: disposeBag)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
//    var realm = try? Realm()
//    try? realm?.write {
//      realm?.add(ColorThemeTemplate.all)
//    }
//    TODO Remove test code
//    let service = MemoService()
//    let memo1 = Memo(text: "az")
//    memo1.checkList.append(CheckItem(name: "asdzxcxzc \(Int.random(in: 0..<6))"))
//    memo1.checkList.append(CheckItem(name: "adadzxczxczxczc \(Int.random(in: 0..<6))"))
//    memo1.labels.append(Label(title: "asdasdasdasdasd \(Int.random(in: 0..<6))"))
//    memo1.labels.append(Label(title: "asdadadsasdasdsadasdasdasdasdasdads \(Int.random(in: 0..<6))"))
//    service.insertMemos([
//      memo1
//      ])

    enableMemoryLeakCheck(disposeBag)
    uiCollectionView.do {
      view.addSubview($0)
      $0.snp.makeConstraints({ make in
        make.edges.equalToSuperview()
      })
      $0.backgroundColor = UIColor.clear
      $0.register(MemoPreviewCell.self, forCellWithReuseIdentifier: MemoPreviewCell.identifier)
      $0.dataSource = self
      $0.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
    }
    collectionViewLayout.delegate = self
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    uiCollectionView.frame = view.bounds
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
      .map({
        $0.toMemoViewModel()
      })
      .asDriver(onErrorJustReturn: [])
      .drive(onNext: { memoPreviews in
        self.data = memoPreviews
      })
      .disposed(by: disposeBag)
  }
}
extension MainViewController: UICollectionViewDelegate {
  
}
extension MainViewController: PinterestLayoutDelegate, UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
    let memo = data[indexPath.row].memo
    let memoAttr = memo.attr ?? MemoAttribute()
    let memoFontType = MemoFontFamilies(rawValue: memoAttr.fontFamily) ?? .system
    let memoFont = memoFontType.font(fontSize: Dimens.Common.memoFontSize.rawValue)
    var height = memo.text.heightForWidth(width: withWidth, font: memoFont)
    height += Asset.icCheckNote.image.height(forWidth: withWidth)
    print("!!!!!!! \(Asset.icCheckNote.image.height(forWidth: withWidth))")
    return height
  }
  
  func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoPreviewCell.identifier, for: indexPath) as? MemoPreviewCell else {
      fatalError()
    }
    cell.configCell(data[indexPath.row])
    return cell
  }
}

private extension Array where Element: Memo {
  func toMemoViewModel() -> [MemoPreviewModel] {
    return self.map { memo in
      MemoPreviewModel(memo: memo)
    }
  }
}
