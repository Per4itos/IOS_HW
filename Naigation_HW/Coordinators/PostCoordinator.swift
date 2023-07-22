//
//  PostCoordinator.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 22.07.2023.
//

import UIKit

protocol PostFlow {
    func coordinateToInfo()
}

final class PostCoordinator: Coordinator, PostFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let postNavigationController = PostViewController()
        postNavigationController.coordinator = self
        
        navigationController?.pushViewController(postNavigationController, animated: true)
    }
    
    func coordinateToInfo() {
        let infoViewCoordinator = InfoCoordinate(navigationController: navigationController!)
        coordinate(to: infoViewCoordinator)
    }
    
}
