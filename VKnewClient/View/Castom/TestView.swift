//
//  TestView.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 24.10.2020.
//

import UIKit

// для аватарки

class TestView: UIView {

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.red.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 50, height: 50))
        
    }
    

}
