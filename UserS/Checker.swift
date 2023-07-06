//
//  Checker.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import UIKit

final class Checker  {
    let login = "n"
    let password = "1"
    
    static let shared = Checker()
    
    private init() {}
    
    func check(log: String, pass: String) -> Bool {
        
        if log == login && pass == password {
            return true
        }else{
            return false
        }
    }
    
   
    
}

