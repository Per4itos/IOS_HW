//
//  PostViewController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "New Post"
    
    private func setupViews() {
        createNavigationBar()
        
        let infoButton = createButtom(imageName: "archivebox.fill", selector: #selector(infoButtomTapped))
        
        navigationItem.rightBarButtonItems = [infoButton]
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        self.navigationItem.title = titlePost
        
        setupViews()
    }
    
    @objc private func infoButtomTapped() {
        
        let vc = InfoViewController()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
}
