//
//  AvatarView.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 27.10.2020.
//

import UIKit


class AvatarView: UIView {
    
    
    @IBInspectable // маркер,и эта проперти появляется интерфейс билдере
    var shadowRadius: CGFloat = 0 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = .seemuBlue {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 1 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable
    var image: UIImage? {
        didSet {
            imageView.image = image
            setNeedsDisplay()
        }
    }
    
    //Mark: - Subviews

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true // сВ - означает обрезать содержимое сабвью по размерам внешней вью
        
        return imageView
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false // тень обрежиться если true, masktoBounds то же самое для layers
        view.backgroundColor = .white
        return view
    }()
    
    // Mark: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setap()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setap()
    }
    
    private func setap() {
        addSubview(shadowView)
        addSubview(imageView) // последний сверху отображается
        
        //расположить правильно вьюхи через констраинтс
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)
                                                        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        shadowView.layer.cornerRadius = shadowView.frame.width / 2
    }
    
    private func updateShadow() {
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
    }
    
    @objc private func viewTapped(sender: UIGestureRecognizer) {
        transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                            self.transform = .identity
                       },
                       completion: nil
        )
    }
}
