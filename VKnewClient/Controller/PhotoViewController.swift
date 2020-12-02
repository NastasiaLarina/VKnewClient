//
//  SecondViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 11.11.2020.
//

import UIKit

class PhotoViewController: UIViewController {

    enum Direction {
        case left, right
        
        init(x: CGFloat) {
            self = x > 0 ? .right : .left
        }
    }
    
    var photo: [String] = [] {
        didSet{
            self.images = photo.compactMap {UIImage.loadAvatar($0) }
        }
    }
    var images: [UIImage] = []
    var currentIndex = 0

    var data: CellData!

    @IBOutlet private(set) var locationImageView: UIImageView!
    lazy var nextImageView = UIImageView()
   
    private var animator: UIViewPropertyAnimator!
    
    
    @IBOutlet private(set) var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let cross = #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysTemplate)
        closeButton.setImage(cross, for: .normal)
        closeButton.tintColor = .seemuBlue
        locationImageView.image = data.image
        locationImageView.contentMode = .scaleAspectFit
        nextImageView.contentMode = .scaleAspectFit
       // locationImageView.image = images[currentIndex]
      
        
        let pan = UIPanGestureRecognizer(target: self,
                                         action: #selector(onPan))
        view.addGestureRecognizer(pan)
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc private func onPan(_ recogniser: UIPanGestureRecognizer) {
        guard let panView = recogniser.view else { return }
        
        let translation = recogniser.translation(in: panView)
        let direction = Direction(x: translation.x)
        
        switch recogniser.state {
        case .began: // анимация текущего слайда
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                self.locationImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.locationImageView.alpha = 0
            })
                // показываем следующий слайд
            if canSlide(direction) {
                let nextIndex = direction == .left ? currentIndex + 1 : currentIndex - 1
                nextImageView.image = images[nextIndex]
                view.addSubview(nextImageView)
                let offsetX = direction == .left ? view.bounds.width : -view.bounds.width
                nextImageView.frame = view.bounds.offsetBy(dx: offsetX, dy: 0)
                    // анимация следующего слайда
                animator.addAnimations({
                    self.nextImageView.center = self.locationImageView.center
                }, delayFactor: 0.2)
            }
            
            animator.addCompletion { (position) in
                guard position == .end else { return }
                self.currentIndex = direction == .left ? self.currentIndex + 1 : self.currentIndex - 1
                self.locationImageView.alpha = 1
                self.locationImageView.transform = .identity
                self.locationImageView.image = self.images[self.currentIndex]
                self.nextImageView.removeFromSuperview()
            }
            animator.pauseAnimation()
            
        case .changed:
            let relativeTransLation = abs(translation.x) / (recogniser.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTransLation))
            animator.fractionComplete = progress
            
        case .ended:
            if canSlide(direction), animator.fractionComplete > 0.6 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            } else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.2) {
                    self.locationImageView.transform = .identity
                    self.locationImageView.alpha = 1
                    let offsetX = direction == .left ? self.view.bounds.width : -self.view.bounds.width
                    self.nextImageView.frame = self.view.bounds.offsetBy(dx: offsetX, dy: 0)
                    self.nextImageView.transform = .identity
                }
            }
        default:
          break
        }
    }
    
    private func canSlide(_ direction: Direction) -> Bool {
         if direction == .left {
    return currentIndex < images.count - 1
         } else {
            return currentIndex > 0
         }
    }
}
