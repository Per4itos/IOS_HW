//
//  FeedModel.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 10.07.2023.
//

import UIKit

class FeedModel {
    
    var secretWord = "1"
    
    func chec(word: String) -> Bool {
        if word == secretWord {
            return true
        }else{
            return false
        }
    }
}
