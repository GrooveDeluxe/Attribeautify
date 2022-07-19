//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

extension UIColor {
    static var appBackground = color(light: .white, dark: .black)
    static var appForeground = color(light: .black, dark: .white)
    static var appDarkGray = color(light: .darkGray, dark: .lightGray)
    static var appRed = color(light: .red, dark: .orange)
    static var appGreen = color(light: .green, dark: .green.withAlphaComponent(0.5))
    static var appBlue = color(light: .blue, dark: .blue.withAlphaComponent(0.5))
}

// MARK: - Color utils -

extension UIColor {
    static func color(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { traitCollection -> UIColor in
                traitCollection.userInterfaceStyle == .dark ? dark : light
            }
        } else {
            return light
        }
    }
}
