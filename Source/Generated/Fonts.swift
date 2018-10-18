// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  internal typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  internal typealias Font = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  internal func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  internal func register() {
    guard let url = url else { return }
    var errorRef: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum NanumBrushScriptOTF {
    internal static let regular = FontConvertible(name: "NanumBrushOTF", family: "Nanum Brush Script OTF", path: "NanumBrush.otf")
  }
  internal enum NanumPenScriptOTF {
    internal static let regular = FontConvertible(name: "NanumPenOTF", family: "Nanum Pen Script OTF", path: "NanumPen.otf")
  }
  internal enum NanumBarunGothicOTF {
    internal static let regular = FontConvertible(name: "NanumBarunGothicOTF", family: "NanumBarunGothicOTF", path: "NanumBarunGothic.otf")
  }
  internal enum NanumBarunpen {
    internal static let regular = FontConvertible(name: "NanumBarunpen", family: "NanumBarunpen", path: "NanumBarunpenRegular.otf")
  }
  internal enum NanumGothicOTF {
    internal static let regular = FontConvertible(name: "NanumGothicOTF", family: "NanumGothicOTF", path: "NanumGothic.otf")
  }
  internal enum NanumMyeongjoOTF {
    internal static let regular = FontConvertible(name: "NanumMyeongjoOTF", family: "NanumMyeongjoOTF", path: "NanumMyeongjo.otf")
  }
  internal enum NanumSquareOTF {
    internal static let regular = FontConvertible(name: "NanumSquareOTFR", family: "NanumSquareOTF", path: "NanumSquareOTFRegular.otf")
  }
}
// swiftlint:enable identifier_name line_length type_body_length

private final class BundleToken {}
