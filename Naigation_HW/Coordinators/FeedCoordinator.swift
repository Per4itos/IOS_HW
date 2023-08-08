//
//  FeedCoordinator.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 22.07.2023.
//

import UIKit

protocol FeedFlow: AnyObject {
    func coordinateToPost()
}

class FeedCoordinator: Coordinator, FeedFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let feedViewController = FeedViewController()
        feedViewController.coordinator = self
        
        navigationController?.pushViewController(feedViewController, animated: false)
    }
    
    func coordinateToPost() {
        let postViewController = PostCoordinator(navigationController: navigationController!)
        coordinate(to: postViewController)
    }
    
    
}
