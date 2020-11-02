//
//  UIColor.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 24.10.2020.
//

import UIKit

extension UIColor {
    
    static let seemuBlue = UIColor(red: 74, green: 134, blue: 204, a: 1.0)

    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    

    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 16) & 0xFF,
            blue: (hex >> 16) & 0xFF,
            a: a
        )
   }

}
