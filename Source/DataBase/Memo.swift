
import Foundation
import RealmSwift
import IGListKit

class Memo: Object, ListDiffable {

  func diffIdentifier() -> NSObjectProtocol {
    return memo_id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? Memo else { return false }
    return self == object
  }

  // swiftlint:disable:next identifier_name
  @objc dynamic var memo_id: String = UUID().uuidString
  @objc dynamic var text: String = ""
  @objc dynamic var attr: MemoAttribute?
  @objc dynamic var colorTheme: ColorTheme?
  @objc dynamic var createAt: Date = Date()
  let labels = List<Label>()
  let checkList = List<CheckItem>()
  convenience init(text: String, attr: MemoAttribute = MemoAttribute(), colorTheme: ColorTheme = ColorThemeTemplate.white) {
    self.init()
    self.text = text
    self.colorTheme = colorTheme
  }
  override static func primaryKey() -> String {
    return "memo_id"
  }
}

class MemoAttribute: Object {
  @objc dynamic var isPin: Bool = false
}
