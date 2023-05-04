//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

// MARK: - AttributedStringConvertible -

public protocol AttributedStringConvertible: Any {
    var string: String { get }
    var attributed: NSAttributedString { get }
    var mutableAttributed: NSMutableAttributedString { get }
    static var empty: NSMutableAttributedString { get }
}

public extension AttributedStringConvertible {
    static var empty: NSMutableAttributedString {
        NSMutableAttributedString()
    }
}

extension String: AttributedStringConvertible {
    public var string: String {
        self
    }

    public var attributed: NSAttributedString {
        NSAttributedString(string: self)
    }

    public var mutableAttributed: NSMutableAttributedString {
        NSMutableAttributedString(string: self)
    }
}

extension NSAttributedString: AttributedStringConvertible {
    public var attributed: NSAttributedString {
        self
    }

    @objc public var mutableAttributed: NSMutableAttributedString {
        NSMutableAttributedString(attributedString: self)
    }
}

public extension NSMutableAttributedString {
    override var mutableAttributed: NSMutableAttributedString {
        self
    }

    func mutate(_ attributes: Attributes...,
                in range: NSRange? = nil,
                for substring: String? = nil) {
        if range != nil && substring != nil {
            assertionFailure("Range and substring can't be used at the same time")
        }
        let resultingRange: NSRange = {
            if let substring = substring {
                if let substringRange = string.range(of: substring) {
                    return NSRange(substringRange, in: string)
                } else {
                    return NSRange()
                }

            } else {
                return range ?? fullRange
            }
        }()
        addAttributes(attributes.flatten, range: resultingRange)
    }
}

// MARK: - AttributedStringConvertible + Optional -

public extension Optional where Wrapped: AttributedStringConvertible {
    var orEmpty: NSMutableAttributedString {
        guard let self = self else { return Wrapped.empty }
        return self.mutableAttributed
    }

    var mutableAttributed: NSMutableAttributedString {
        orEmpty.mutableAttributed
    }

    func apply(_ attributes: Attributes...,
               in range: NSRange? = nil,
               for substring: String? = nil) -> NSMutableAttributedString {
        orEmpty.apply(attributes.flatten, in: range, for: substring)
    }
}

// MARK: - AttributedStringConvertible + Utility -

public extension AttributedStringConvertible {
    var fullRange: NSRange {
        .init(0..<string.count)
    }

    func apply(_ attributes: Attributes...,
               in range: NSRange? = nil,
               for substring: String? = nil) -> NSMutableAttributedString {
        let mutableAttributebString = mutableAttributed
        mutableAttributebString.mutate(attributes.flatten, in: range, for: substring)
        return mutableAttributebString
    }
}

// MARK: - AttributedStringConvertible + Attributes -

public extension AttributedStringConvertible {
    func font(_ font: UIFont, in range: NSRange? = nil, for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.font(font), in: range, for: substring)
    }

    /// Overwrite paragraph style
    func paragraphStyle(_ paragraphStyle: NSParagraphStyle,
                        in range: NSRange? = nil,
                        for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.paragraphStyle(paragraphStyle), in: range, for: substring)
    }

    /// Mutate paragraph style
    func mutateParagraphStyle(_ paragraphStyleAttributes: ParagraphStyleAttribute...,
                              in range: NSRange? = nil,
                              for substring: String? = nil) -> NSMutableAttributedString {
        if range != nil && substring != nil {
            assertionFailure("Range and substring can't be used at the same time")
        }
        
        let attributedString = mutableAttributed
        guard !attributedString.string.isEmpty else { return attributedString }

        let resultingRange: NSRange = {
            if let substring = substring, let substringRange = attributedString.string.range(of: substring) {
                return NSRange(substringRange, in: attributedString.string)
            } else {
                return range ?? attributedString.fullRange
            }
        }()
        let attributes = attributedString.attributes(at: 0, longestEffectiveRange: nil, in: resultingRange)
        let updatedAttributes = attributes.mutateParagraphStyle(paragraphStyleAttributes)
        return attributedString.apply(updatedAttributes, in: resultingRange)
    }

    func foregroundColor(_ color: UIColor,
                         in range: NSRange? = nil,
                         for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.foregroundColor(color), in: range, for: substring)
    }

    func backgroundColor(_ color: UIColor,
                         in range: NSRange? = nil,
                         for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.backgroundColor(color), in: range, for: substring)
    }

    func ligature(_ ligature: Int,
                  in range: NSRange? = nil,
                  for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.ligature(ligature), in: range, for: substring)
    }

    func kern(_ kern: CGFloat, in range: NSRange? = nil, for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.kern(kern), in: range, for: substring)
    }

    @available(iOS 14.0, *)
    func tracking(_ tracking: CGFloat,
                  in range: NSRange? = nil,
                  for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.tracking(tracking), in: range, for: substring)
    }

    func strikethroughStyle(_ strikethroughStyle: Int,
                            in range: NSRange? = nil,
                            for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.strikethroughStyle(strikethroughStyle), in: range, for: substring)
    }

    func underlineStyle(_ underlineStyle: Int,
                        in range: NSRange? = nil,
                        for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.underlineStyle(underlineStyle), in: range, for: substring)
    }

    func strokeColor(_ strokeColor: UIColor,
                     in range: NSRange? = nil,
                     for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.strokeColor(strokeColor), in: range, for: substring)
    }

    func strokeWidth(_ strokeWidth: CGFloat,
                     in range: NSRange? = nil,
                     for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.strokeWidth(strokeWidth), in: range, for: substring)
    }

    func shadow(_ shadow: NSShadow,
                in range: NSRange? = nil,
                for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.shadow(shadow), in: range, for: substring)
    }

    func textEffect(_ textEffect: String,
                    in range: NSRange? = nil,
                    for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.textEffect(textEffect), in: range, for: substring)
    }

    func attachment(_ attachment: NSTextAttachment,
                    in range: NSRange? = nil,
                    for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.attachment(attachment), in: range, for: substring)
    }

    func link(_ link: NSURL, in range: NSRange? = nil, for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.link(link), in: range, for: substring)
    }

    func link(_ link: URL, in range: NSRange? = nil, for substring: String? = nil) -> NSMutableAttributedString {
        guard let url = NSURL(string: link.absoluteString) else {
            assertionFailure("URL must be converted to NSURL!")
            return mutableAttributed
        }
        return mutableAttributed.apply(.link(url), in: range, for: substring)
    }

    func link(_ link: String, in range: NSRange? = nil, for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.link(link), in: range, for: substring)
    }

    func baselineOffset(_ baselineOffset: CGFloat,
                        in range: NSRange? = nil,
                        for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.baselineOffset(baselineOffset), in: range, for: substring)
    }

    func underlineColor(_ underlineColor: UIColor,
                        in range: NSRange? = nil,
                        for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.underlineColor(underlineColor), in: range, for: substring)
    }

    func strikethroughColor(_ strikethroughColor: UIColor,
                            in range: NSRange? = nil,
                            for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.strikethroughColor(strikethroughColor), in: range, for: substring)
    }

    func obliqueness(_ obliqueness: CGFloat,
                     in range: NSRange? = nil,
                     for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.obliqueness(obliqueness), in: range, for: substring)
    }

    func expansion(_ expansion: CGFloat,
                   in range: NSRange? = nil,
                   for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.expansion(expansion), in: range, for: substring)
    }

    func writingDirection(_ writingDirection: [NSNumber],
                          in range: NSRange? = nil,
                          for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.writingDirection(writingDirection), in: range, for: substring)
    }

    func verticalGlyphForm(_ verticalGlyphForm: Int,
                           in range: NSRange? = nil,
                           for substring: String? = nil) -> NSMutableAttributedString {
        mutableAttributed.apply(.verticalGlyphForm(verticalGlyphForm), in: range, for: substring)
    }
}

// MARK: - AttributedStringConvertible + Debug -

public extension AttributedStringConvertible {
    func debug(_ prefix: String? = nil) -> NSMutableAttributedString {
        print((prefix ?? "Attribeautify: ") + mutableAttributed)
        return mutableAttributed
    }
}

// MARK: - AttributedStringConvertible + Attributes + Convenience -

public extension AttributedStringConvertible {
    func asLink() -> NSMutableAttributedString {
        let mutableString = mutableAttributed
        guard let url = NSURL(string: mutableString.string) else {
            assertionFailure("Can't make url from string - \(mutableString.string)")
            return mutableString
        }
        return mutableString.link(url)
    }
}

// MARK: - AttributedStringConvertible + Concatenation -

public func + (lhs: String?, rhs: String?) -> String? {
    guard lhs != nil || rhs != nil else { return nil }
    return (lhs ?? "") + (rhs ?? "")
}

public func + (lhs: NSAttributedString?, rhs: String?) -> NSMutableAttributedString? {
    guard lhs != nil || rhs != nil else { return nil }
    return lhs.mutableAttributed + rhs.mutableAttributed
}

public func + (lhs: String?, rhs: NSAttributedString?) -> NSMutableAttributedString? {
    guard lhs != nil || rhs != nil else { return nil }
    return lhs.mutableAttributed + rhs.mutableAttributed
}

public func + (lhs: NSAttributedString?, rhs: NSAttributedString?) -> NSMutableAttributedString? {
    guard lhs != nil || rhs != nil else { return nil }
    return lhs.mutableAttributed + rhs.mutableAttributed
}

// MARK: - String + NSAttributedString + Concatenation -

public extension String {
    static func + (lhs: String, rhs: NSAttributedString) -> NSMutableAttributedString {
        lhs.mutableAttributed + rhs.mutableAttributed
    }

    static func + (lhs: String, rhs: NSAttributedString?) -> NSMutableAttributedString {
        lhs.mutableAttributed + rhs.mutableAttributed
    }

    static func + (lhs: NSAttributedString, rhs: String) -> NSMutableAttributedString {
        lhs.mutableAttributed + rhs.mutableAttributed
    }

    static func + (lhs: NSAttributedString?, rhs: String) -> NSMutableAttributedString {
        lhs.mutableAttributed + rhs.mutableAttributed
    }
}

public extension NSAttributedString {
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
        let string = lhs.mutableAttributed
        string.append(rhs)
        return string
    }
}
