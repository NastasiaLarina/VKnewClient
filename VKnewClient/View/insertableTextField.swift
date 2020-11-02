//
//  insertableTextField.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 16.10.2020.
//

import UIKit

class InsertableTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
}
