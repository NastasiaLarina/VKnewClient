//
//  CustomInteractiveTransition.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 14.11.2020.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {

    
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handlePan)
            )
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted = false
    var shouldFinished = false
    
    @objc func handlePan(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        
        case .began:
            hasStarted = true
            viewController?.navigationController?.popViewController(animated: true)
            
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            shouldFinished = progress > 0.33
            update(progress)
            
        case .ended:
            hasStarted = false
            shouldFinished ? finish() : cancel()
            
        case .cancelled:
            hasStarted = false
            cancel()
            
        default:
            return
        }
    }
}
