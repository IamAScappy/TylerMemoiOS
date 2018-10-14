import Foundation
import IGListKit

final class CheckItemModel: NSObject {
  let collapsed: Bool
  var items: [CheckItem] = []

  public init(collapsed: Bool = false, items: [CheckItem] = []) {
    self.collapsed = collapsed
    self.items = items
  }
}
extension CheckItemModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return self === object ? true : self.isEqual(object)
  }
}

protocol CheckListSectionControllerDelegate: class {
  func createNewCheckItem()
}
class CheckListSectionController: ListSectionController {
  private var object: CheckItemModel?
  weak var delegate: CheckListSectionControllerDelegate?

  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: Dimens.AddMemo.documentOfMargine.rawValue, bottom: 5, right: Dimens.AddMemo.documentOfMargine.rawValue)
    minimumLineSpacing = 4
    minimumInteritemSpacing = 4
    supplementaryViewSource = self
  }
  override func numberOfItems() -> Int {
    return object?.items.count ?? 0
  }
  override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext!.containerSize.width, height: Dimens.CheckList.checkCellHeight.rawValue)
  }
  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: CheckItemCell.self, for: self, at: index) as? CheckItemCell else {
      fatalError()
    }
    guard let item = object?.items[index] else { return cell }
    cell.configCell(item)
    return cell
  }
  override func didUpdate(to object: Any) {
    self.object = object as? CheckItemModel
  }
  @objc func tappedMakeNewCheckItem() {
    delegate?.createNewCheckItem()
  }
}

extension CheckListSectionController: ListSupplementaryViewSource {
  func supportedElementKinds() -> [String] {
    return [UICollectionView.elementKindSectionFooter]
  }

  func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
    switch elementKind {
    case UICollectionView.elementKindSectionFooter:
      guard let cell = collectionContext?.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionFooter,
        for: self,
        class: MakeCheckItemFooterView2.self,
        at: index) as? MakeCheckItemFooterView2 else { fatalError() }
      cell.viewTapsGesture.addTarget(self, action: #selector(tappedMakeNewCheckItem))
      return cell
    default: fatalError()
    }
  }
  func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
    return CGSize(width: collectionContext!.containerSize.width, height: 40)
  }
}
