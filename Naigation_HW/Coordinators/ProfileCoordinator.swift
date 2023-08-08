//
//  ProfileCoordinator.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 22.07.2023.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let user = User(email: "", password: "", name: "", image: UIImage(named: "image3")!, status: "")
        
        let profileViewController = ProfileViewController(user: user)
        profileViewController.coordinator = self
        
        navigationController.pushViewController(profileViewController, animated: true)
    }
    

    
}
