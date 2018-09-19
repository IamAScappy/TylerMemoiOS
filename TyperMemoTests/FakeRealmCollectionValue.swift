//
//

import Foundation
import RealmSwift
@testable import TyperMemo

class FakeRealmCollectionValue<T: RealmCollectionValue> {
  var count: Int = 0
  var values: [RealmCollectionChange<Results<T>>] = [RealmCollectionChange<Results<T>>]()
  func captureObserve(results: RealmCollectionChange<Results<T>>) {
    count += 1
    values.append(results)
  }
}
