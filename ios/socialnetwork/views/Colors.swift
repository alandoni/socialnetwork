//
//  Colors.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 21/01/20.
//  Copyright © 2020 Alan Donizete Quintiliano. All rights reserved.
//

import UIKit
import SwiftUI

class Colors {
    static let backgroundColor = UIColor(argb: 0xfff4f4f4);
    static let borderColor = UIColor(argb: 0xffcacaca);
    static let textColor = UIColor(argb: 0xff212529);
    static let textFieldBorderColor = UIColor(argb: 0xffced4da);
    static let textFieldColor = UIColor(argb: 0xff495057);
    static let primaryColor = UIColor(argb: 0xff037afb);
    static let primaryTextColor = UIColor(argb: 0xff037afb);
    static let buttonColor = UIColor(argb: 0xffffffff);
    static let sectionBackgroundColor = UIColor(argb: 0xfffefefe);
    static let errorBackgroundColor = UIColor(argb: 0xfff8d7da);
    static let errorTextColor = UIColor(argb: 0xff721c24);
    static let errorBorderColor = UIColor(argb: 0xfff5c6cb);
    static let warningBackgroundColor = UIColor(argb: 0xfffff3cd);
    static let warningTextColor = UIColor(argb: 0xff856404);
    static let warningBorderColor = UIColor(argb: 0xffffeeba);

    static func toColor(color: UIColor) {
        
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 255) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }

    func toColor() -> Color {
        return Color(self)
    }
}
