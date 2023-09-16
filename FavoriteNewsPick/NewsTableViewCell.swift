//
//  NewsTableViewCell.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 15.09.2023.
//

import UIKit
import CoreData

class NewsTableViewCell: UITableViewCell {

    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subTextLabel: UILabel = {
        let subTextLabel = UILabel()
        subTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subTextLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subTextLabel.textColor = .systemGray
        subTextLabel.numberOfLines = 0
        return subTextLabel
    }()
    
    private lazy var likeLabel: UILabel = {
        let likeLabel = UILabel()
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        return likeLabel
    }()
    
    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(with news: News) {
        self.myImageView.image = UIImage(named: (news.image ?? "image1"))
         self.titleLabel.text = news.title
         self.subTextLabel.text = news.text
         self.likeLabel.text = news.likes
         self.viewsLabel.text = news.views
         
     }
     
     func changeText(_ text: String) {
         self.titleLabel.text = text
     }
     
     private func setupView() {
         self.contentView.addSubview(self.myImageView)
         self.contentView.addSubview(self.titleLabel)
         self.contentView.addSubview(self.subTextLabel)
         self.contentView.addSubview(self.likeLabel)
         self.contentView.addSubview(self.viewsLabel)
         
         
         NSLayoutConstraint.activate([
             self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
             self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
             
             self.myImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 52),
             self.myImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
             self.myImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
             self.myImageView.bottomAnchor.constraint(equalTo: self.subTextLabel.topAnchor, constant: -16),
             
             
             self.subTextLabel.topAnchor.constraint(equalTo: self.myImageView.bottomAnchor, constant: 16),
             self.subTextLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
             self.subTextLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15),
             self.subTextLabel.bottomAnchor.constraint(equalTo: self.likeLabel.topAnchor, constant: -16),
             
             
             self.likeLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
             self.likeLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
             
             
             self.viewsLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
             self.viewsLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10)
             
         ])
     }

}
