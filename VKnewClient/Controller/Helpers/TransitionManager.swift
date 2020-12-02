//
//  TransitionManager.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 11.11.2020.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    var presenting = true
    
    // MARK: методы протокола UIViewControllerAnimatedTransitioning
    
    // метод, в котором непосредственно указывается анимация перехода от одного  viewcontroller к другому
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            // код анимации
            
            // 1
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
            
            // 1
        let π = CGFloat(Double.pi)
            
            // 2
        let offScreenRotateIn = CGAffineTransform(rotationAngle: π/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: -π/2)
            
            // 3
            toView.transform = self.presenting ? offScreenRotateIn : offScreenRotateOut
            
            // 4
        toView.layer.anchorPoint = CGPoint(x:0, y:0)
        fromView.layer.anchorPoint = CGPoint(x:0, y:0)
            
            // 5
            toView.layer.position = CGPoint(x:1, y:1)
            fromView.layer.position = CGPoint(x:1, y:1)
            

            container.addSubview(toView)
            container.addSubview(fromView)
            
            // 5
        let duration = self.transitionDuration(using: transitionContext)
            
            // 6
        UIView.animate(withDuration: duration, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.4, options: [], animations: { () -> Void in
            container.backgroundColor = UIColor.white
               fromView.transform = offScreenRotateIn
               toView.transform = CGAffineTransform.identity
                
                
                }) { (finished) -> Void in
                    // 7
                    transitionContext.completeTransition(true)
            }
        }
    
    // метод возвращает количество секунд, которые длится анимация
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.9
    }
    
    
    //MARK: методы протокола UIViewControllerTransitioningDelegate
        
        // аниматор для презентации viewController
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            self.presenting = true
            return self
        }
        
        // аниматор для скрытия viewController
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            self.presenting = false
            return self
        }
    
}
