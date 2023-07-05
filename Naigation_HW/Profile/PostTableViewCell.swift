//
//  PostHeaderView.swift
//  Naigation_HW
//
//  Created by macOS on 24.09.2022.
//

import UIKit
import StorageService

public class PostTableViewCell: UITableViewCell {
    
    private lazy var lImage: UIImageView = {
        
        let imageLikse = UIImageView()
        imageLikse.translatesAutoresizingMaskIntoConstraints = false
        return imageLikse
    }()
    
    private lazy var vImage: UIImageView = {
        
        let imageViews = UIImageView()
        imageViews.translatesAutoresizingMaskIntoConstraints = false
        
        return imageViews
    }()
    
    private lazy var titleLable: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        title.textColor = .black
        title.numberOfLines = 2
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private lazy var text: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .systemGray
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private lazy var someImage: UIImageView = {
        let someImage = UIImageView()
        someImage.contentMode = .scaleAspectFit
        someImage.backgroundColor = .black
        someImage.translatesAutoresizingMaskIntoConstraints = false
        
        return someImage
    }()
    private lazy var likes: UITextField = {
        let likes = UITextField()
        likes.translatesAutoresizingMaskIntoConstraints = false
        
        return likes
    }()
    
    private lazy var views: UITextField = {
        let views = UITextField()
        views.translatesAutoresizingMaskIntoConstraints = false
        
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   public func setup(with post: Post) {
       self.titleLable.text = post.author
        self.text.text = post.description
        self.someImage.image = post.imageView
        self.likes.text = post.likes
        self.views.text = post.views
        self.lImage.image = post.likesImage
        self.vImage.image = post.viewsImage
    }
    
    func changeText(_ text: String) {
        self.text.text = text
    }
    
    private func setupView() {
        self.contentView.addSubview(self.lImage)
        self.contentView.addSubview(self.vImage)
        self.contentView.addSubview(self.titleLable)
        self.contentView.addSubview(self.text)
        self.contentView.addSubview(self.likes)
        self.contentView.addSubview(self.views)
        self.contentView.addSubview(self.someImage)
        
        NSLayoutConstraint.activate([
            
            self.titleLable.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.titleLable.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.titleLable.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            
            self.someImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 52),
            self.someImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.someImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            
            self.text.topAnchor.constraint(equalTo: self.someImage.bottomAnchor, constant: 16),
            self.text.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.text.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            
            self.lImage.topAnchor.constraint(equalTo: self.text.bottomAnchor, constant: 16),
            self.lImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.lImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            
            self.likes.topAnchor.constraint(equalTo: self.text.bottomAnchor, constant: 16),
            self.likes.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.likes.leftAnchor.constraint(equalTo: self.lImage.rightAnchor),
            
            self.vImage.topAnchor.constraint(equalTo: self.text.bottomAnchor, constant: 16),
            self.vImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.vImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            
            self.views.topAnchor.constraint(equalTo: self.text.bottomAnchor, constant: 16),
            self.views.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.views.rightAnchor.constraint(equalTo: self.vImage.leftAnchor)
        ])
    }
}

