//
//  LoginCoordinator.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 22.07.2023.
//

import UIKit

protocol StartFlow: AnyObject {
    func coordinateToTapBar()
}

class LoginCoordinator: Coordinator, StartFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LogInViewController(loginInspectr: LoginInspector())
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func coordinateToTapBar() {
        let appTabBarCoordinator = AppTabBarCoordinator(navigationController: navigationController)
        coordinate(to: appTabBarCoordinator)
    }
}
