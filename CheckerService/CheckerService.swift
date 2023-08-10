//
//  CheckerService.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 07.08.2023.
//

import UIKit
import FirebaseAuth


protocol CheckerServiceProtocol {
    
    func checkCredentials(for email: String, and password: String,completionFor completion: @escaping ((Result<User,Error>) -> Void))
    
    func signUp(for email: String, and password: String,completionFor completion: @escaping ((Result<User,Error>) -> Void))
    
}


class CheckerService: CheckerServiceProtocol {
    
    func checkCredentials(for email: String, and password: String, completionFor completion: @escaping ((Result<User, Error>) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error == nil && email == "adham@mail.ru" {
                let user = User(email: email, password: password, name: "Adham", image: UIImage(named: "image4")!, status: "Im very tired")
                completion(.success(user))
            } else {
                if error == nil {
                    let user = User(email: email, password: password, name: "New Profile", image: UIImage(named: "image2")!, status: "Waiting for something...")
                    completion(.success(user))
                } else {
                    completion(.failure(error!))
                }
            }
        }
    }
    
    func signUp(for email: String, and password: String, completionFor completion: @escaping ((Result<User, Error>) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: email) { result, error in
            if error == nil {
                let user = User(email: email, password: password, name: "New Profile", image: UIImage(named: "image3")!, status: "Waiting for something...")
                completion(.success(user))
            } else {
                completion(.failure(error!))
            }
        }
    }
}
