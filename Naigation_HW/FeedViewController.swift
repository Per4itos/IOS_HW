//
//  FeedViewController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0 , y: 0, width: 200, height: 50))
        button.setTitle("Go in", for: .normal)
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(self.button)
        self.button.center = self.view.center
        
    }
    
    @objc private func buttonAction() {
        
        let postViewController = PostViewController()
        
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
}
