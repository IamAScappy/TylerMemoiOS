//
//  Storyboard+SwiftInject.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import UIKit

extension SwinjectStoryboard {
  @objc class func setup() {
//    root container
    defaultContainer.register(ServiceProviderType.self) { _ in ServiceProvider() }
//    label container
    // swiftlint:disable:next identifier_name
    defaultContainer.register(LabelReactor.self) { r in LabelReactor(provider: r.resolve(ServiceProviderType.self)!) }
    // swiftlint:disable:next identifier_name
    defaultContainer.storyboardInitCompleted(LabelViewController.self) { r, c in
      c.reactor = r.resolve(LabelReactor.self)
    }
  }
}
