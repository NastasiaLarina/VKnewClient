//
//  UIImageExtention.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 10.11.2020.
//

import UIKit

extension UIImage {
    
    static func loadAvatar(_ title: String) -> UIImage? {
        return UIImage(named: "Avatars/\(title)")
    }
    
}
