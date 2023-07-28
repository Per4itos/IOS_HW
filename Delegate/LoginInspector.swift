//
//  loginInspector.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 05.07.2023.
//

import Foundation


struct LoginInspector: LoginViewControllerDelegate {
    
    func check(log: String, pass: String) -> Result<Bool, NetworkError> {
        
        if log == Checker.shared.login && pass == Checker.shared.password  {
        
            return .success(true)
            
        }else {
            return .failure(NetworkError.incorrectDate)
        }
    }
}
    

