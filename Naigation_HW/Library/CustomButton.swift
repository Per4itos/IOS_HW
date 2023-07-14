//
//  CustonButton.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 10.07.2023.
//

import UIKit

class CustomButton: UIButton {
    
    typealias Action = () -> Void
    
    var title: String
    var titleColor: UIColor
    var buttonColor: UIColor
    var buttonCornRadius: CGFloat
    var shadow: Bool
    var tapAction: Action
    
    init (title: String, titleColor: UIColor, buttonColor: UIColor, buttonCornRadius: CGFloat, shadow: Bool, tapAction: @escaping Action) {
        self.title = title
        self.titleColor = titleColor
        self.buttonColor = buttonColor
        self.buttonCornRadius = buttonCornRadius
        self.shadow = shadow
        self.tapAction = tapAction
        super.init(frame: .zero)
        
        backgroundColor = buttonColor
        layer.cornerRadius = buttonCornRadius
        
        if shadow == true {
            layer.shadowOffset = CGSize(width: 4, height: 4)
            layer.shadowOpacity = 0.7
            layer.shadowRadius = 4
            layer.masksToBounds = false
        }
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setTitle(title, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        tapAction()
    }
    
    
    
}
