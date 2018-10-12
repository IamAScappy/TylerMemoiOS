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
    defaultContainer.register(MemoServiceType.self) { _ in MemoService() }
    defaultContainer.register(LabelServiceType.self) { _ in LabelService() }
    defaultContainer.register(CheckListType.self) { _ in CheckListService() }
    defaultContainer.register(ColorThemeType.self) { _ in ColorThemeService() }
//    label container
    // swiftlint:disable:next identifier_name
    defaultContainer.register(LabelReactor.self) { r in LabelReactor(labelService: r.resolve(LabelServiceType.self)!) }
    // swiftlint:disable:next identifier_name
    defaultContainer.storyboardInitCompleted(LabelViewController.self) { r, c in
      c.reactor = r.resolve(LabelReactor.self)
    }
    //    label container
    // swiftlint:disable:next identifier_name
    defaultContainer.register(AddMemoReactor.self) { r in AddMemoReactor(r.resolve(MemoServiceType.self)!) }
    // swiftlint:disable:next identifier_name
    defaultContainer.storyboardInitCompleted(AddMemoViewController.self) { r, c in
      c.reactor = r.resolve(AddMemoReactor.self)
      c.colorThemeService = r.resolve(ColorThemeType.self)
    }
    //    checklist container
    // swiftlint:disable:next identifier_name
    defaultContainer.register(CheckListReactor.self) { r in CheckListReactor(r.resolve(CheckListType.self)!) }
    // swiftlint:disable:next identifier_name
    defaultContainer.storyboardInitCompleted(CheckListBottomSheetViewController.self) { r, c in
      c.reactor = r.resolve(CheckListReactor.self)
    }
  }
}
