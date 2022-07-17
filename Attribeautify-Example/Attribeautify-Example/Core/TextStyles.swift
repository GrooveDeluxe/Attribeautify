//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit
import Attribeautify

extension Attributes {
    static var title: Self {
        .font(.systemFont(ofSize: 24, weight: .heavy))
        .foregroundColor(.appForeground)
    }

    static var subtitle: Self {
        .font(.systemFont(ofSize: 20, weight: .semibold))
        .foregroundColor(.appDarkGray)
    }

    static var body: Self {
        .font(.systemFont(ofSize: 17, weight: .regular))
        .foregroundColor(.appForeground)
    }

    static var error: Self {
        .font(.systemFont(ofSize: 17, weight: .semibold))
        .foregroundColor(.appRed)
    }
}

extension AttributedStringConvertible {
    var title: NSMutableAttributedString {
        mutableAttributed.apply(.title)
    }

    var subtitle: NSMutableAttributedString {
        mutableAttributed.apply(.subtitle)
    }

    var body: NSMutableAttributedString {
        mutableAttributed.apply(.body)
    }

    var error: NSMutableAttributedString {
        mutableAttributed.apply(.error)
    }
}

