//
//  LetterPicker.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 28.10.2020.
//

import UIKit

protocol LetterPickerDelegate: class  {//только класс может реализовывать протокол
    func letterPicked(_ letter: String)
}

class LetterPicker: UIView {
    
    weak var delegate: LetterPickerDelegate? //добавили свойство delegate кот.соответствует протоколу
    
    var letters: [String] = "absdefghigklmnopqrstuvwxvz".map {String($0) } {
        didSet {
           reload()
        }
    }
    
    // Mark: - Subviews
    
    private var buttons: [UIButton] = []
    private var lastPressedButton: UIButton?
    // при конструировании каст.класса лучше все делать приватным, кроме методов и свойств при помощи которым взаимодействуем с этим классом извне
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.tintColor = .seemuBlue
        return stackView
        
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
        backgroundColor = .clear
        setupButtons()
        addSubview(stackView)
        // делаем для стэка констрайнты
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        //добавляем жесты UIGestureRecognizer
        let pan = UIPanGestureRecognizer(target: self,
                                         action: #selector(panAction))
        addGestureRecognizer(pan)
    }
    
    private func setupButtons() {
        for letter in letters {
            let button = UIButton(type: .system)
            button.setTitle(letter.uppercased(), for: .normal)
            button.addTarget(self,
                             action: #selector(letterTapped),
                             for: .touchDown)
            buttons.append(button)//добавление в массив buttons
            stackView.addArrangedSubview(button)//добавляем в стэк кнопку
            button.heightAnchor.constraint(equalToConstant: 20).isActive = true//задаем высоту кнопок
            
        }
    }
    
    // Mark: - Actions
    
    @objc private func letterTapped(_ sender: UIButton) {
        guard lastPressedButton != sender else { return }
        lastPressedButton = sender
        let letter = sender.title(for: .normal) ?? ""
        delegate?.letterPicked(letter)
    }
    
    @objc private func panAction(_ recognazer: UIGestureRecognizer) {
        let anchorPoint = recognazer.location(in: self)
        let buttonHeight = bounds.height / CGFloat(buttons.count)
        let buttonIndex = Int(anchorPoint.y / buttonHeight)
        
        guard buttonIndex >= 0 && buttonIndex < buttons.count else { return}
        
        let button = buttons[buttonIndex]
        unhiglightButtons()//убираем все подсветки
        button.isHighlighted = true
        letterTapped(button) // кнопка должна быть нажата
        
        switch recognazer.state {
        case .ended:
            unhiglightButtons()
        default:
            break
        }
    }
    
    private func unhiglightButtons() {
        buttons.forEach { $0.isHighlighted = false } // убрать состояние кнопки на норму, подсветка
    }
    
    private func reload() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview()}
        buttons = []
        lastPressedButton = nil
        setupButtons()
    }
    
}

