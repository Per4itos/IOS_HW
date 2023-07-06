//
//  MyLoginFactory.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 06.07.2023.
//

import Foundation


struct MyLoginFactoryStruct: LoginFactory {
    
    
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
        
    }
    
    
}
