//
//  InfoViewController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Go in", for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.backgroundColor = .blue
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        
        self.view.addSubview(self.closeButton)
        self.closeButton.center = self.view.center
        
    }
    
    @objc private func didTapCloseButton() {
        
        let alertController = UIAlertController(title: "Close", message: "Are you sure?", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Y", style: .default) { _ in
            print("Yes")
        }
        let secondAction = UIAlertAction(title: "N", style: .destructive) { _ in
            print("No")
        }
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
    }
    
}
