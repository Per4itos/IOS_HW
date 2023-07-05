//
//  File.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

class CurrentUserService: UserService {
    
    var user: User?
    
    func chekLog(login: String) -> User? {
        if login == persone1.logIn {
            return persone1
        }else{
            return user
        }
    }
}
