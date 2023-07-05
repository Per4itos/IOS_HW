//
//  PostBarController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

extension UIViewController {
    
    
    func createNavigationBar () {
        
    }
    
    func createButtom(imageName: String, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        
        return menuBarItem
    }
}
