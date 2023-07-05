//
//  File2.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

class TestUserSercive: UserService {
    
    var user: User?
    
    func chekLog(login: String) -> User? {
        if login == persone2.logIn {
            return persone2
        }else{
            return user
        }
    }
}

