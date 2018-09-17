// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2196f3"></span>
  /// Alpha: 100% <br/> (0x2196f3ff)
  internal static let themeBlue = ColorName(rgbaValue: 0x2196f3ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#795548"></span>
  /// Alpha: 100% <br/> (0x795548ff)
  internal static let themeBrown = ColorName(rgbaValue: 0x795548ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#00bcd4"></span>
  /// Alpha: 100% <br/> (0x00bcd4ff)
  internal static let themeCyan = ColorName(rgbaValue: 0x00bcd4ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#9e9e9e"></span>
  /// Alpha: 100% <br/> (0x9e9e9eff)
  internal static let themeGray = ColorName(rgbaValue: 0x9e9e9eff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4caf50"></span>
  /// Alpha: 100% <br/> (0x4caf50ff)
  internal static let themeGreen = ColorName(rgbaValue: 0x4caf50ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3f51b5"></span>
  /// Alpha: 100% <br/> (0x3f51b5ff)
  internal static let themeIndigo = ColorName(rgbaValue: 0x3f51b5ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cddc39"></span>
  /// Alpha: 100% <br/> (0xcddc39ff)
  internal static let themeLime = ColorName(rgbaValue: 0xcddc39ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e91e63"></span>
  /// Alpha: 100% <br/> (0xe91e63ff)
  internal static let themePink = ColorName(rgbaValue: 0xe91e63ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#673ab7"></span>
  /// Alpha: 100% <br/> (0x673ab7ff)
  internal static let themePurple = ColorName(rgbaValue: 0x673ab7ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f44336"></span>
  /// Alpha: 100% <br/> (0xf44336ff)
  internal static let themeRed = ColorName(rgbaValue: 0xf44336ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#009688"></span>
  /// Alpha: 100% <br/> (0x009688ff)
  internal static let themeTeal = ColorName(rgbaValue: 0x009688ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffeb3b"></span>
  /// Alpha: 100% <br/> (0xffeb3bff)
  internal static let themeYellow = ColorName(rgbaValue: 0xffeb3bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let black = ColorName(rgbaValue: 0xffffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 100% <br/> (0x000000ff)
  internal static let white = ColorName(rgbaValue: 0x000000ff)
}
// swiftlint:enable identifier_name line_length type_body_length

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
