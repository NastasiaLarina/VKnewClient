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
    
    @IBOutlet weak var myView: UIView!
    var path : UIBezierPath!
    
    // MARK: - Life cicles
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeCloud()
        addAnimationPath()
       
        
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
                                      message: "Wrong login or password",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Cloud/Animation
    
    func addAnimationPath()  {
        
        let layer = CAShapeLayer()
        layer.path  = path.cgPath
        let path = UIBezierPath(rect: myView.bounds)
        
        layer.strokeEnd = 0
        layer.lineCap = CAShapeLayerLineCap.round
        layer.lineWidth = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 14
        layer.shadowOffset = CGSize(width: 1, height: 1)
       layer.shadowOpacity = 0.9
        layer.strokeColor = UIColor.seemuBlue.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.position = CGPoint(x: 120, y: 250)
        

        let animationStart = CABasicAnimation(keyPath: "strokeStart")
        animationStart.toValue = 1
        animationStart.fromValue = 0
        animationStart.duration = 5
        layer.add(animationStart, forKey: nil)
        myView.layer.addSublayer(layer)
        
        let animationEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationEnd.toValue = 1.2
        animationEnd.fromValue = 0
        animationEnd.duration = 5
        layer.add(animationEnd, forKey: nil)
        myView.layer.addSublayer(layer)
       
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            layer.removeFromSuperlayer()
            self.myView.removeFromSuperview()
        }
    }
    
    func makeCloud()  {
        // Initialize the path.
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 109.29, y: 57.43))
        path.addCurve(to: CGPoint(x: 106.16, y: 57.62), controlPoint1: CGPoint(x: 108.25, y: 57.43), controlPoint2: CGPoint(x: 107.2, y: 57.49))
        path.addCurve(to: CGPoint(x: 85.23, y: 42.11), controlPoint1: CGPoint(x: 103.34, y: 48.42), controlPoint2: CGPoint(x: 94.85, y: 42.13))
        path.addCurve(to: CGPoint(x: 78.19, y: 43.29), controlPoint1: CGPoint(x: 82.83, y: 42.11), controlPoint2: CGPoint(x: 80.45, y: 42.51))
        path.addCurve(to: CGPoint(x: 46.27, y: 27.46), controlPoint1: CGPoint(x: 72.59, y: 31.17), controlPoint2: CGPoint(x: 59.31, y: 24.59))
        path.addCurve(to: CGPoint(x: 23.96, y: 55.24), controlPoint1: CGPoint(x: 33.23, y: 30.34), controlPoint2: CGPoint(x: 23.96, y: 41.89))
        path.addCurve(to: CGPoint(x: 24.82, y: 62.08), controlPoint1: CGPoint(x: 23.96, y: 57.55), controlPoint2: CGPoint(x: 24.25, y: 59.84))
        path.addCurve(to: CGPoint(x: 4.45, y: 87.64), controlPoint1: CGPoint(x: 12.4, y: 63.98), controlPoint2: CGPoint(x: 3.52, y: 75.11))
        path.addCurve(to: CGPoint(x: 28.34, y: 109.94), controlPoint1: CGPoint(x: 5.37, y: 100.17), controlPoint2: CGPoint(x: 15.78, y: 109.88))
        path.addLine(to: CGPoint(x: 109.29, y: 109.94))
        path.addCurve(to: CGPoint(x: 135.55, y: 83.68), controlPoint1: CGPoint(x: 123.79, y: 109.94), controlPoint2: CGPoint(x: 135.55, y: 98.18))
        path.addCurve(to: CGPoint(x: 109.29, y: 57.43), controlPoint1: CGPoint(x: 135.55, y: 69.18), controlPoint2: CGPoint(x: 123.79, y: 57.43))
        path.close()
    }
}

