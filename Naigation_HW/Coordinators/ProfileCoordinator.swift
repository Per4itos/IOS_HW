//
//  ProfileCoordinator.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 22.07.2023.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
#if DEBUG
    var userService = TestUserSercive()
#else
    var userService = CurrentUserService()
#endif
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let user = userService.user
        
        let profileViewController = ProfileViewController(user: user)
        profileViewController.coordinator = self
        
        navigationController.pushViewController(profileViewController, animated: true)
    }
    

    
}
