//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

// MARK: - Attributes -

public typealias Attributes = [NSAttributedString.Key: Any]

// MARK: - Attributes + Utility -

public extension Attributes {
    static func + (lhs: Attributes, rhs: Attributes) -> Attributes {
        lhs.merging(rhs) { $1 }
    }

    func apply(_ attributes: Attributes...) -> Attributes {
        self + attributes.flatten
    }
}

extension Array where Element == Attributes {
    var flatten: Attributes {
        reduce(Attributes(), +)
    }
}

// MARK: - Attributes + Static -

public extension Attributes {
    static func font(_ font: UIFont) -> Attributes {
        [.font: font]
    }

    static func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Attributes {
        [.paragraphStyle: paragraphStyle]
    }

    static func foregroundColor(_ color: UIColor) -> Attributes {
        [.foregroundColor: color]
    }

    static func backgroundColor(_ color: UIColor) -> Attributes {
        [.backgroundColor: color]
    }

    static func ligature(_ ligature: Int) -> Attributes {
        [.ligature: ligature]
    }

    static func kern(_ kern: CGFloat) -> Attributes {
        [.kern: kern]
    }

    @available(iOS 14.0, *)
    static func tracking(_ tracking: CGFloat) -> Attributes {
        [.tracking: tracking]
    }

    static func strikethroughStyle(_ strikethroughStyle: Int) -> Attributes {
        [.strikethroughStyle: strikethroughStyle]
    }

    static func underlineStyle(_ underlineStyle: Int) -> Attributes {
        [.underlineStyle: underlineStyle]
    }

    static func strokeColor(_ strokeColor: UIColor) -> Attributes {
        [.strokeColor: strokeColor]
    }

    static func strokeWidth(_ strokeWidth: CGFloat) -> Attributes {
        [.strokeWidth: strokeWidth]
    }

    static func shadow(_ shadow: NSShadow) -> Attributes {
        [.shadow: shadow]
    }

    static func textEffect(_ textEffect: String) -> Attributes {
        [.textEffect: textEffect]
    }

    static func attachment(_ attachment: NSTextAttachment) -> Attributes {
        [.attachment: attachment]
    }

    static func link(_ link: NSURL) -> Attributes {
        [.link: link]
    }

    static func link(_ link: String) -> Attributes {
        [.link: link]
    }

    static func baselineOffset(_ baselineOffset: CGFloat) -> Attributes {
        [.baselineOffset: baselineOffset]
    }

    static func underlineColor(_ underlineColor: UIColor) -> Attributes {
        [.underlineColor: underlineColor]
    }

    static func strikethroughColor(_ strikethroughColor: UIColor) -> Attributes {
        [.strikethroughColor: strikethroughColor]
    }

    static func obliqueness(_ obliqueness: CGFloat) -> Attributes {
        [.obliqueness: obliqueness]
    }

    static func expansion(_ expansion: CGFloat) -> Attributes {
        [.expansion: expansion]
    }

    static func writingDirection(_ writingDirection: [NSNumber]) -> Attributes {
        [.writingDirection: writingDirection]
    }

    static func verticalGlyphForm(_ verticalGlyphForm: Int) -> Attributes {
        [.verticalGlyphForm: verticalGlyphForm]
    }
}

// MARK: - Attributes + Flow -

public extension Attributes {
    func font(_ font: UIFont) -> Attributes {
        self + [.font: font]
    }

    func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Attributes {
        self + [.paragraphStyle: paragraphStyle]
    }

    func foregroundColor(_ color: UIColor) -> Attributes {
        self + [.foregroundColor: color]
    }

    func backgroundColor(_ color: UIColor) -> Attributes {
        self + [.backgroundColor: color]
    }

    func ligature(_ ligature: Int) -> Attributes {
        self + [.ligature: ligature]
    }

    func kern(_ kern: CGFloat) -> Attributes {
        self + [.kern: kern]
    }

    @available(iOS 14.0, *)
    func tracking(_ tracking: CGFloat) -> Attributes {
        self + [.tracking: tracking]
    }

    func strikethroughStyle(_ strikethroughStyle: Int) -> Attributes {
        self + [.strikethroughStyle: strikethroughStyle]
    }

    func underlineStyle(_ underlineStyle: Int) -> Attributes {
        self + [.underlineStyle: underlineStyle]
    }

    func strokeColor(_ strokeColor: UIColor) -> Attributes {
        self + [.strokeColor: strokeColor]
    }

    func strokeWidth(_ strokeWidth: CGFloat) -> Attributes {
        self + [.strokeWidth: strokeWidth]
    }

    func shadow(_ shadow: NSShadow) -> Attributes {
        self + [.shadow: shadow]
    }

    func textEffect(_ textEffect: String) -> Attributes {
        self + [.textEffect: textEffect]
    }

    func attachment(_ attachment: NSTextAttachment) -> Attributes {
        self + [.attachment: attachment]
    }

    func link(_ link: NSURL) -> Attributes {
        self + [.link: link]
    }

    func link(_ link: String) -> Attributes {
        self + [.link: link]
    }

    func baselineOffset(_ baselineOffset: CGFloat) -> Attributes {
        self + [.baselineOffset: baselineOffset]
    }

    func underlineColor(_ underlineColor: UIColor) -> Attributes {
        self + [.underlineColor: underlineColor]
    }

    func strikethroughColor(_ strikethroughColor: UIColor) -> Attributes {
        self + [.strikethroughColor: strikethroughColor]
    }

    func obliqueness(_ obliqueness: CGFloat) -> Attributes {
        self + [.obliqueness: obliqueness]
    }

    func expansion(_ expansion: CGFloat) -> Attributes {
        self + [.expansion: expansion]
    }

    func writingDirection(_ writingDirection: [NSNumber]) -> Attributes {
        self + [.writingDirection: writingDirection]
    }

    func verticalGlyphForm(_ verticalGlyphForm: Int) -> Attributes {
        self + [.verticalGlyphForm: verticalGlyphForm]
    }
}

// MARK: - Attributes + ParagraphStyleAttribute -

public enum ParagraphStyleAttribute {
    case lineSpacing(CGFloat)
    case paragraphSpacing(CGFloat)
    case alignment(NSTextAlignment)
    case firstLineHeadIndent(CGFloat)
    case headIndent(CGFloat)
    case tailIndent(CGFloat)
    case lineBreakMode(NSLineBreakMode)
    case lineHeight(CGFloat)
    case minimumLineHeight(CGFloat)
    case maximumLineHeight(CGFloat)
    case baseWritingDirection(NSWritingDirection)
    case lineHeightMultiple(CGFloat)
    case paragraphSpacingBefore(CGFloat)
    case hyphenationFactor(Float)
    case usesDefaultHyphenation(Bool)
    case tabStops([NSTextTab])
    case defaultTabInterval(CGFloat)
    case allowsDefaultTighteningForTruncation(Bool)
    case lineBreakStrategy(NSParagraphStyle.LineBreakStrategy)
    case addTabStop(NSTextTab)
    case removeTabStop(NSTextTab)
}

public extension Attributes {
    func mutateParagraphStyle(_ paragraphStyleAttributes: ParagraphStyleAttribute...) -> Attributes {
        mutateParagraphStyle(paragraphStyleAttributes)
    }

    func mutateParagraphStyle(_ paragraphStyleAttributes: [ParagraphStyleAttribute]) -> Attributes {
        let mutableParagraphStyle = NSMutableParagraphStyle()
        if let paragraphStyle = self[.paragraphStyle] as? NSParagraphStyle {
            mutableParagraphStyle.setParagraphStyle(paragraphStyle)
        }
        paragraphStyleAttributes.forEach {
            switch $0 {
            case .lineSpacing(let value):
                mutableParagraphStyle.lineSpacing = value

            case .paragraphSpacing(let value):
                mutableParagraphStyle.paragraphSpacing = value

            case .alignment(let value):
                mutableParagraphStyle.alignment = value

            case .firstLineHeadIndent(let value):
                mutableParagraphStyle.firstLineHeadIndent = value

            case .headIndent(let value):
                mutableParagraphStyle.headIndent = value

            case .tailIndent(let value):
                mutableParagraphStyle.tailIndent = value

            case .lineBreakMode(let value):
                mutableParagraphStyle.lineBreakMode = value

            case .lineHeight(let value):
                mutableParagraphStyle.minimumLineHeight = value
                mutableParagraphStyle.maximumLineHeight = value

            case .minimumLineHeight(let value):
                mutableParagraphStyle.minimumLineHeight = value

            case .maximumLineHeight(let value):
                mutableParagraphStyle.maximumLineHeight = value

            case .baseWritingDirection(let value):
                mutableParagraphStyle.baseWritingDirection = value

            case .lineHeightMultiple(let value):
                mutableParagraphStyle.lineHeightMultiple = value

            case .paragraphSpacingBefore(let value):
                mutableParagraphStyle.paragraphSpacingBefore = value

            case .hyphenationFactor(let value):
                mutableParagraphStyle.hyphenationFactor = value

            case .usesDefaultHyphenation(let value):
                if #available(iOS 15.0, *) {
                    mutableParagraphStyle.usesDefaultHyphenation = value
                }

            case .tabStops(let value):
                mutableParagraphStyle.tabStops = value

            case .defaultTabInterval(let value):
                mutableParagraphStyle.defaultTabInterval = value

            case .allowsDefaultTighteningForTruncation(let value):
                mutableParagraphStyle.allowsDefaultTighteningForTruncation = value

            case .lineBreakStrategy(let value):
                mutableParagraphStyle.lineBreakStrategy = value

            case .addTabStop(let value):
                mutableParagraphStyle.addTabStop(value)

            case .removeTabStop(let value):
                mutableParagraphStyle.removeTabStop(value)
            }
        }
        return self + [.paragraphStyle: mutableParagraphStyle]
    }
}
