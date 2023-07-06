//
//  File2.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

class TestUserSercive: UserService {
    func chekLog(login: String) -> User? {
        login == user.logIn ? user: nil
    }
    
    let user = User(logIn: "userTest", name: "nameTest", image: UIImage(named: "image12")!, status: "statusTest")
    }


