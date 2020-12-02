//
//  SearchView.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 06.11.2020.
//

import UIKit

final class SearchView: UIView, UITextFieldDelegate {
    
    var text: String? {
        return ""
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var textFieldLeading: NSLayoutConstraint!
    @IBOutlet weak var searchIconCenterX: NSLayoutConstraint!
    @IBOutlet weak var cancelButtonTrailing: NSLayoutConstraint!
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let iconWidth = searchIcon.frame.width
        searchIconCenterX.constant = -(bounds.width / 2 - iconWidth)
        textFieldLeading.constant = iconWidth * 2
        cancelButtonTrailing.constant = 10
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
        return true
    }
    
    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        
        searchIconCenterX.constant = 0
        textFieldLeading.constant = 0
        cancelButtonTrailing.constant = -60
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
        
    }
    
}
