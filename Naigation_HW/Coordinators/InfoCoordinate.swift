//
//  InfoCoordinate.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 22.07.2023.
//

import UIKit

class InfoCoordinate: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let infoNavigationController = InfoViewController()
        infoNavigationController.coordinator = self
    
        
        navigationController?.pushViewController(infoNavigationController, animated: true)
    }
    
}
