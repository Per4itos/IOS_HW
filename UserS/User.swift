//
//  File.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

class User {
    
    var logIn: String
    var name: String
    var image: UIImage
    var status: String
    
    init(logIn: String, name: String, image: UIImage, status: String) {
        self.logIn = logIn
        self.name = name
        self.image = image
        self.status = status
    }
}

let persone1 = User(logIn: "name123", name: "NAME", image: UIImage(named: "image13")!, status: "My status")

let persone2 = User(logIn: "name321", name: "name", image: UIImage(named: "image10")!, status: "Test status")
