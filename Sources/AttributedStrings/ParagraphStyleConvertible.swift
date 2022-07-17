//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

// MARK: - ParagraphStyleConvertible -

public protocol ParagraphStyleConvertible: Any {
    var style: NSParagraphStyle { get }
    var mutableStyle: NSMutableParagraphStyle { get }
}

extension NSParagraphStyle: ParagraphStyleConvertible {
    public var style: NSParagraphStyle {
        self
    }

    @objc public var mutableStyle: NSMutableParagraphStyle {
        let style = NSMutableParagraphStyle()
        style.setParagraphStyle(self)
        return style
    }
}

extension NSMutableParagraphStyle {
    override public var mutableStyle: NSMutableParagraphStyle {
        self
    }
}

// MARK: - ParagraphStyleConvertible + Static -

public extension ParagraphStyleConvertible {
    static func paragraphStyle(configure: ((NSMutableParagraphStyle) -> Void)? = nil) -> NSMutableParagraphStyle {
        let style = NSMutableParagraphStyle()
        configure?(style)
        return style
    }

    static func lineSpacing(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.lineSpacing = value
        }
    }

    static func paragraphSpacing(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.paragraphSpacing = value
        }
    }

    static func alignment(_ value: NSTextAlignment) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.alignment = value
        }
    }

    static func firstLineHeadIndent(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.firstLineHeadIndent = value
        }
    }

    static func headIndent(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.headIndent = value
        }
    }

    static func tailIndent(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.tailIndent = value
        }
    }

    static func lineBreakMode(_ value: NSLineBreakMode) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.lineBreakMode = value
        }
    }

    static func minimumLineHeight(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.minimumLineHeight = value
        }
    }

    static func maximumLineHeight(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.maximumLineHeight = value
        }
    }

    static func baseWritingDirection(_ value: NSWritingDirection) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.baseWritingDirection = value
        }
    }

    static func lineHeightMultiple(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.lineHeightMultiple = value
        }
    }

    static func paragraphSpacingBefore(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.paragraphSpacingBefore = value
        }
    }

    static func hyphenationFactor(_ value: Float) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.hyphenationFactor = value
        }
    }

    @available(iOS 15.0, *)
    static func usesDefaultHyphenation(_ value: Bool) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.usesDefaultHyphenation = value
        }
    }

    static func tabStops(_ value: [NSTextTab]!) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.tabStops = value
        }
    }

    static func defaultTabInterval(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.defaultTabInterval = value
        }
    }

    static func allowsDefaultTighteningForTruncation(_ value: Bool) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.allowsDefaultTighteningForTruncation = value
        }
    }

    static func lineBreakStrategy(_ value: NSParagraphStyle.LineBreakStrategy) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.lineBreakStrategy = value
        }
    }
}

// MARK: - ParagraphStyleConvertible + Static + Convenience -

public extension ParagraphStyleConvertible {
    static func lineHeight(_ value: CGFloat) -> NSMutableParagraphStyle {
        .paragraphStyle {
            $0.minimumLineHeight = value
            $0.maximumLineHeight = value
        }
    }
}

// MARK: - ParagraphStyleConvertible + Flow -

public extension ParagraphStyleConvertible {
    func mutate(_ configure: (NSMutableParagraphStyle) -> Void) -> NSMutableParagraphStyle {
        let style = mutableStyle
        configure(style)
        return style
    }

    func lineSpacing(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.lineSpacing = value
        }
    }

    func paragraphSpacing(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.paragraphSpacing = value
        }
    }

    func alignment(_ value: NSTextAlignment) -> NSMutableParagraphStyle {
        mutate {
            $0.alignment = value
        }
    }

    func firstLineHeadIndent(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.firstLineHeadIndent = value
        }
    }

    func headIndent(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.headIndent = value
        }
    }

    func tailIndent(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.tailIndent = value
        }
    }

    func lineBreakMode(_ value: NSLineBreakMode) -> NSMutableParagraphStyle {
        mutate {
            $0.lineBreakMode = value
        }
    }

    func minimumLineHeight(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.minimumLineHeight = value
        }
    }

    func maximumLineHeight(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.maximumLineHeight = value
        }
    }

    func baseWritingDirection(_ value: NSWritingDirection) -> NSMutableParagraphStyle {
        mutate {
            $0.baseWritingDirection = value
        }
    }

    func lineHeightMultiple(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.lineHeightMultiple = value
        }
    }

    func paragraphSpacingBefore(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.paragraphSpacingBefore = value
        }
    }

    func hyphenationFactor(_ value: Float) -> NSMutableParagraphStyle {
        mutate {
            $0.hyphenationFactor = value
        }
    }

    @available(iOS 15.0, *)
    func usesDefaultHyphenation(_ value: Bool) -> NSMutableParagraphStyle {
        mutate {
            $0.usesDefaultHyphenation = value
        }
    }

    func tabStops(_ value: [NSTextTab]!) -> NSMutableParagraphStyle {
        mutate {
            $0.tabStops = value
        }
    }

    func defaultTabInterval(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.defaultTabInterval = value
        }
    }

    func allowsDefaultTighteningForTruncation(_ value: Bool) -> NSMutableParagraphStyle {
        mutate {
            $0.allowsDefaultTighteningForTruncation = value
        }
    }

    func lineBreakStrategy(_ value: NSParagraphStyle.LineBreakStrategy) -> NSMutableParagraphStyle {
        mutate {
            $0.lineBreakStrategy = value
        }
    }
}

// MARK: - ParagraphStyleConvertible + Flow + Convenience -

public extension ParagraphStyleConvertible {
    func lineHeight(_ value: CGFloat) -> NSMutableParagraphStyle {
        mutate {
            $0.minimumLineHeight = value
            $0.maximumLineHeight = value
        }
    }
}
