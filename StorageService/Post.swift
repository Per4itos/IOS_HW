//
//  Post.swift
//  Naigation_HW
//
//  Created by macOS on 23.09.2022.
//

import UIKit


 public struct Post {
     public let author: String
     public let description: String
     public let imageView: UIImage?
     public let likes: String?
     public let views: String?
     public let likesImage: UIImage?
     public let viewsImage: UIImage?
     
     public init(author: String, description: String, imageView: UIImage?, likes: String?, views: String?, likesImage: UIImage?, viewsImage: UIImage?) {
         self.author = author
         self.description = description
         self.imageView = imageView
         self.likes = likes
         self.views = views
         self.likesImage = likesImage
         self.viewsImage = viewsImage
     }
    
}

