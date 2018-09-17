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
  @objc dynamic var color: String = ColorName.white.color.toRGBAString()
  @objc dynamic var textColor: String = ColorName.white.color.toRGBAString()

  convenience init(title: String, color: String, textColor: String = ColorName.white.color.toRGBAString()) {
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
  static let white = ColorTheme(title: "WHITE", color: ColorName.white.color.toRGBAString(),
                                textColor: ColorName.black.color.toRGBAString())
  static let red = ColorTheme(title: "RED", color: ColorName.themeRed.color.toRGBAString())
  static let purple = ColorTheme(title: "purple", color: ColorName.themePurple.color.toRGBAString())
  static let indigo = ColorTheme(title: "indigo", color: ColorName.themeIndigo.color.toRGBAString())
  static let pink = ColorTheme(title: "pink", color: ColorName.themePink.color.toRGBAString())
  static let blue = ColorTheme(title: "pink", color: ColorName.themeBlue.color.toRGBAString())
  static let cyan = ColorTheme(title: "cyan", color: ColorName.themeCyan.color.toRGBAString())
  static let teal = ColorTheme(title: "teal", color: ColorName.themeTeal.color.toRGBAString())
  static let green = ColorTheme(title: "green", color: ColorName.themeGreen.color.toRGBAString())
  static let lime = ColorTheme(title: "lime", color: ColorName.themeLime.color.toRGBAString())
  static let yellow = ColorTheme(title: "yellow", color: ColorName.themeYellow.color.toRGBAString())
  static let brown = ColorTheme(title: "brown", color: ColorName.themeBrown.color.toRGBAString())
  static let gray = ColorTheme(title: "gray", color: ColorName.themeGray.color.toRGBAString())
}
