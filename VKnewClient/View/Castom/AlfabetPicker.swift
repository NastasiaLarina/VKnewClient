//
//  AlfabetPicker.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 25.10.2020.
//

import UIKit


enum Leter: Int, CaseIterable{
    case A, B, C
    var title: String {
        switch self {
        case .A: return "A"
        case .B: return "B"
        case .C: return "C"
            
        }
        
    }
}

final class AlfabetPicker: UIControl {
    
    var selectedLeter: Leter? = nil {
        didSet {
            updateSelectedLeter()
            sendActions(for: .valueChanged)
        }
    }
    // MARK: - Views
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        
    }
// MARK: - Setap
    private func setup() {
        for leter in Leter.allCases {
        let button = UIButton(type: .system)
            button.setTitle(leter.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.black, for: .selected)
            button.addTarget(self,
                             action: #selector(selectLeter),
                             for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.distribution = .fillEqually

    }
    
    @objc private func selectLeter(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender),
              let leter = Leter(rawValue: index)
        else { return }
        
        selectedLeter = leter
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        superview?.frame = bounds
    }
    private func updateSelectedLeter() {
        for (index, button) in buttons.enumerated() {
            guard let leter = Leter(rawValue: index) else {continue}
            button.isSelected = leter == selectedLeter
        }
    }
}
