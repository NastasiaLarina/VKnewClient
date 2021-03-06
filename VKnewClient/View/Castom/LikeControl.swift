//
//  LikeControl.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 27.10.2020.
//

import UIKit

@IBDesignable
class LikeControl: UIControl {
    
    @IBInspectable
    // добавляем проперти
    var isliked: Bool = false {
        didSet{
            updateLike()
        }
    }
    
    @IBInspectable
    var likesCount: Int = 0 {
        didSet {
            countLabel.text = "\(likesCount)"// так как likesCount интеджер Int, приводим в строку
        }
    }
    
    @IBInspectable
    var color: UIColor = .seemuBlue {
        didSet {
            likeButton.tintColor = color
            countLabel.textColor = color
        }
    }
    
    //Mark: - Subviews

    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = color
        button.addTarget(self,
                         action: #selector(likeButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = color
        label.text = "0"
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        return stackView
    }()
    
    // Mark: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        // ложим в стэк методом addA... кнопку и каунтер
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(countLabel)
    }
    
    // Mark: - Action
    
    @objc private func likeButtonTapped(_ sender: UIButton){
        isliked.toggle() // поменять значение
        sendActions(for: .valueChanged)
        transform = CGAffineTransform(scaleX: 2, y: 2)
        
        UIView.animate(withDuration: 1,
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
    
    private func updateLike() {
        let imageName = isliked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageName), for: .normal)
        likesCount = isliked ? likesCount + 1 : likesCount - 1
    }
}
