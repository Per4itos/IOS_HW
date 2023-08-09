//
//  File.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

class User {
    
    var email: String
    var password: String
    var name: String
    var image: UIImage
    var status: String
    
   init(email: String, password: String, name: String, image: UIImage, status: String) {
        self.email = email
        self.password = password
        self.name = name
        self.image = image
        self.status = status
   
    }
}


