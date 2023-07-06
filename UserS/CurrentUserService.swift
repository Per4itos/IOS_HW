//
//  File.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

class CurrentUserService: UserService {
    
    func chekLog(login: String) -> User? {
        login == user.logIn ? user: nil
    }
    
    let user = User(logIn: "user", name: "nameT", image: UIImage(named: "image10")!, status: "my status")
    }

