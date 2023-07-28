//
//  CustomAlertView.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 28.07.2023.
//

import UIKit
import SwiftEntryKit

class CustomAlertView: UIView {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var nameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.font = UIFont.init(name: "Helvetica", size: 13)
        nameLable.numberOfLines = 0
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLable
    }()
    
    private lazy var actionButton = CustomButton(title: "Get", titleColor: .green, buttonColor: .blue, buttonCornRadius: 6, shadow: false, tapAction: { self.actionButtonTap()})
    
    init(image: UIImage, name: String) {
        super.init(frame: UIScreen.main.bounds)
        profileImageView.image = image
        nameLable.text = name
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionButtonTap() {
        print("Premium Subscribe")
    }
    
    
    private func setupConstraints() {
        
        addSubview(profileImageView)
        addSubview(nameLable)
        addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLable.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            nameLable.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15),
            nameLable.rightAnchor.constraint(equalTo: actionButton.leftAnchor, constant: -20),
            
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            actionButton.heightAnchor.constraint(equalToConstant: 30),
            actionButton.widthAnchor.constraint(equalToConstant: 50),
            
            bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 21)
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }
    
}
