//
//  AudioTableViewCell.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 28.07.2023.
//

import UIKit

class AudioTableViewCell: UITableViewCell {
    
    private lazy var audioLable: UILabel = {
        let audioLable = UILabel()
        audioLable.text = "Audio"
        audioLable.textColor = .darkGray
        audioLable.translatesAutoresizingMaskIntoConstraints = false
        
        return audioLable
    }()
    
    private lazy var audioImage: UIImageView = {
        let audioImage = UIImageView()
        audioImage.image = UIImage(systemName: "music.note.tv")
        audioImage.tintColor = .blue
        audioImage.translatesAutoresizingMaskIntoConstraints = false
        
        return audioImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.contentView.addSubview(self.audioLable)
        self.contentView.addSubview(self.audioImage)
        
        NSLayoutConstraint.activate([
            self.audioLable.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.audioLable.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            
            self.audioImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.audioImage.leftAnchor.constraint(equalTo: self.audioLable.rightAnchor, constant: 5)
            
        ])
    }
    
    
}
