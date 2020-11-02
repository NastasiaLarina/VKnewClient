//
//  LoginViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 17.10.2020.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordButton: UIButton!
    
    // MARK: - Life cicles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordButton.layer.cornerRadius = 10
        passwordButton.layer.masksToBounds = true
        login.text = "admin"
        passwordTextField.text = "123"
        
        let attributeString = NSAttributedString(string: "FORGOT PASSWORD?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.underlineStyle: 1])
        passwordButton.setAttributedTitle(attributeString, for: .normal)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardDidShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Segue
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "ToTabBar" else { return true}
        
        let isvalid = validateCredentials()
        if !isvalid {
            showLoginErrorAlert()
        }
        return isvalid
    }
    
    // MARK: - Action
    
    @IBAction func scrollTapped(_ sender: UIGestureRecognizer){
        view.endEditing(true)
    }
    
    
    
    // MARK: - Keyboard Events
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentInset = .zero
        
    }
    
    // MARK: - Helpers
    
    func validateCredentials() -> Bool {
        return login.text == "admin" && passwordTextField.text == "123"
    }
    
    func showLoginErrorAlert() {
        let alert = UIAlertController(title: "Wrong!",
                                      message: "Wrong login or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
