//
//  ProfileHeaderView.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private lazy var nameLable: UILabel = {
        
        let lable = UILabel()
        lable.textColor = UIColor.black
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        return lable
    }()
    private lazy var textLable: UILabel = {
        
        let lable2 = UILabel()
        lable2.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lable2.textColor = .gray
        lable2.translatesAutoresizingMaskIntoConstraints = false
        
        return lable2
    }()
    private lazy var statusButton: UIButton = {
        
        let button = UIButton()
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: UIControl.State.normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    


    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2
        self.avatarImageView.clipsToBounds = true
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.nameLable)
        self.addSubview(self.textLable)
        self.addSubview(self.statusButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            
            nameLable.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLable.leftAnchor.constraint(equalTo: self.avatarImageView.rightAnchor),
            
            statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16),
            statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            
            textLable.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -34),
            textLable.leftAnchor.constraint(equalTo: self.avatarImageView.rightAnchor),

        ])
    }
    
    func setup(with profile: Profile1) {
        self.textLable.text = profile.text
        self.nameLable.text = profile.name
        self.avatarImageView.image = profile.image
    }
    
    @objc private func buttonAction() {
        print(textLable.text ?? "No text")
    }
    
    @objc private func buttonAction2() {
        print(nameLable.text ?? "No text")
    }
}
