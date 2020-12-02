//
//  CustomNavigationController2.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 11.11.2020.
//

import UIKit

class CustomNavigationController2: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionManager()
        }
}
