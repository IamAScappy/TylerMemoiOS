//
//  ColorTheme.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 16..
//
import Foundation
import RealmSwift

class ColorTheme: Object {
  // swiftlint:disable:next identifier_name
  @objc dynamic var color_theme_id: String = UUID().uuidString
  @objc dynamic var title: String = ""
  @objc dynamic var color: String = ColorName.white.toHexString()
  @objc dynamic var textColor: String = ColorName.white.toHexString()

  convenience init(title: String, color: String, textColor: String = ColorName.white.toHexString()) {
    self.init()
    self.title = title
    self.color = color
    self.textColor = textColor
  }
  override static func primaryKey() -> String {
    return "color_theme_id"
  }
}

struct ColorThemeTemplate: OptionSet {
  let rawValue: Int
  static let white = ColorTheme(title: "WHITE", color: ColorName.white.toHexString(),
                                textColor: ColorName.black.toHexString())
  static let red = ColorTheme(title: "RED", color: ColorName.themeRed.toHexString())
  static let purple = ColorTheme(title: "purple", color: ColorName.themePurple.toHexString())
  static let indigo = ColorTheme(title: "indigo", color: ColorName.themeIndigo.toHexString())
  static let pink = ColorTheme(title: "pink", color: ColorName.themePink.toHexString())
  static let blue = ColorTheme(title: "pink", color: ColorName.themeBlue.toHexString())
  static let cyan = ColorTheme(title: "cyan", color: ColorName.themeCyan.toHexString())
  static let teal = ColorTheme(title: "teal", color: ColorName.themeTeal.toHexString())
  static let green = ColorTheme(title: "green", color: ColorName.themeGreen.toHexString())
  static let lime = ColorTheme(title: "lime", color: ColorName.themeLime.toHexString())
  static let yellow = ColorTheme(title: "yellow", color: ColorName.themeYellow.toHexString())
  static let brown = ColorTheme(title: "brown", color: ColorName.themeBrown.toHexString())
  static let gray = ColorTheme(title: "gray", color: ColorName.themeGray.toHexString())
  static let all = [red, white, purple, indigo, pink, blue, cyan, teal, green, lime, yellow, brown, gray]
}
