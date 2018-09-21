//
//  ColorTheme.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 16..
//
import RealmSwift
import Foundation

class ColorTheme: Object {
  // swiftlint:disable:next identifier_name
  @objc dynamic var color_theme_id: String = UUID().uuidString
  @objc dynamic var title: String = ""
  @objc dynamic var color: String = ColorName.white.toRGBAString()
  @objc dynamic var textColor: String = ColorName.white.toRGBAString()

  convenience init(title: String, color: String, textColor: String = ColorName.white.toRGBAString()) {
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
  static let white = ColorTheme(title: "WHITE", color: ColorName.white.toRGBAString(),
                                textColor: ColorName.black.toRGBAString())
  static let red = ColorTheme(title: "RED", color: ColorName.themeRed.toRGBAString())
  static let purple = ColorTheme(title: "purple", color: ColorName.themePurple.toRGBAString())
  static let indigo = ColorTheme(title: "indigo", color: ColorName.themeIndigo.toRGBAString())
  static let pink = ColorTheme(title: "pink", color: ColorName.themePink.toRGBAString())
  static let blue = ColorTheme(title: "pink", color: ColorName.themeBlue.toRGBAString())
  static let cyan = ColorTheme(title: "cyan", color: ColorName.themeCyan.toRGBAString())
  static let teal = ColorTheme(title: "teal", color: ColorName.themeTeal.toRGBAString())
  static let green = ColorTheme(title: "green", color: ColorName.themeGreen.toRGBAString())
  static let lime = ColorTheme(title: "lime", color: ColorName.themeLime.toRGBAString())
  static let yellow = ColorTheme(title: "yellow", color: ColorName.themeYellow.toRGBAString())
  static let brown = ColorTheme(title: "brown", color: ColorName.themeBrown.toRGBAString())
  static let gray = ColorTheme(title: "gray", color: ColorName.themeGray.toRGBAString())
  static let all = [red, white, purple, indigo, pink, blue, cyan, teal, green, lime, yellow, brown, gray]
}
