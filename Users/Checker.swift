//
//  Checker.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

final class Checker  {
    
    var login = "n"
    var password = "1"
    
    static let shared = Checker()
    
    private init() {}
    
    func check(log: String, pass: String) -> Result<Bool, NetworkError> {
        
        if log == login && pass == password {
            return .success(true)
        }else{
            return .failure(NetworkError.incorrectDate)
        }
    }
    
   
    
}

