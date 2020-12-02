//
//  LaunchViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 13.11.2020.
//

import UIKit

class LaunchViewController: UIViewController {

    
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    private func animate() {
        let duration = 0.75
        
//        let rotation = CABasicAnimation(keyPath: "transform.rotation")
//        rotation.fromValue = 0
//        rotation.toValue = Double(CGFloat.pi * 2)
//        rotation.duration = duration
//        rotation.repeatCount = 1
//        logoImageView.layer.add(rotation, forKey: nil)
        
        logoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(
            withDuration: duration * 3,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                self.logoImageView.transform = .identity
            },
            completion: { finished in
                guard finished else { return }
                self.home()
            })
    }
    
    private func home() {
        performSegue(withIdentifier: "Home", sender: nil)
    }


}
