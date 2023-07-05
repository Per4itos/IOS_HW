//
//  PhotosTableViewCell.swift
//  Naigation_HW
//
//  Created by macOS on 20.10.2022.
//

import UIKit
import StorageService


 public class PhotosTableViewCell: UITableViewCell {
    
//    struct ViewPhoto {
//        let lable: String = "Photo"
//        let image1: UIImage? = UIImage(named: "image0")
//        let image2: UIImage? = UIImage(named: "image1")
//        let image3: UIImage? = UIImage(named: "image2")
//        let image4: UIImage? = UIImage(named: "image3")
//        
//    }
    
    private lazy var lableName: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return lable
    }()
    
    private lazy var tupButton: UIButton = {
        let button  = UIButton()
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var photoImage: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .black
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false

        return photo
    }()
    
    private lazy var photoImage2: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.backgroundColor = .black
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()
    
    private lazy var photoImage3: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.backgroundColor = .black
        photo.translatesAutoresizingMaskIntoConstraints = false

        
        return photo
    }()
    
    private lazy var photoImage4: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .black
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
      func setup(with postHeader: PostHeader) {
         self.photoImage.image = postHeader.image1
        self.photoImage2.image = postHeader.image2
        self.photoImage3.image = postHeader.image3
        self.photoImage4.image = postHeader.image4
        self.lableName.text = postHeader.lable
    }
    
    private func setupView() {
        self.contentView.addSubview(self.photoImage4)
        self.contentView.addSubview(self.photoImage3)
        
        self.contentView.addSubview(self.photoImage2)
        self.contentView.addSubview(self.photoImage)
        self.contentView.addSubview(self.tupButton)
        self.contentView.addSubview(self.lableName)
        
        
        NSLayoutConstraint.activate([
            //
            self.lableName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.lableName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            
            self.tupButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.tupButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
            self.tupButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1),
            
            self.tupButton.bottomAnchor.constraint(equalTo: self.photoImage.topAnchor, constant: -12),
            
            self.photoImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.22),
            self.photoImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            self.photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -12),
            self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 44),
            
            self.photoImage2.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.22),
            self.photoImage2.leftAnchor.constraint(equalTo: self.photoImage.rightAnchor, constant: 8),
            self.photoImage2.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -12),
            self.photoImage2.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 44),
            
            self.photoImage3.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.22),
            self.photoImage3.leftAnchor.constraint(equalTo: self.photoImage2.rightAnchor, constant: 8),
            self.photoImage3.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -12),
            self.photoImage3.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 44),
            
            self.photoImage4.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.22),
            self.photoImage4.leftAnchor.constraint(equalTo: self.photoImage3.rightAnchor, constant: 8),
            self.photoImage4.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -12),
            self.photoImage4.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 44),
            
        ])
        
    }
    
    
}
