//
//  ViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 16.10.2020.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var passwordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributeString = NSAttributedString(string: "FORGOT PASSWORD?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.underlineStyle: 1])
        passwordButton.setAttributedTitle(attributeString, for: .normal)
    }
  
    
}

