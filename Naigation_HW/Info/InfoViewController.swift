//
//  InfoViewController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var coordinator: InfoCoordinate?
    
    var arrayOfPeople = [String]()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Go in", for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.backgroundColor = .blue
        
        return button
    }()
    
    private lazy var titleLable: UILabel = {
       let titleLable = UILabel(frame: CGRect(x: 105, y: 20, width: 200, height: 50))
        
        return titleLable
    }()
    
    private lazy var orbitalLable: UILabel = {
       let orbitableLable = UILabel(frame: CGRect(x: 190, y: 50, width: 150, height: 50))
        
        return orbitableLable
    }()
    
    private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: CGRect(x: 16, y: 110 , width: 380, height: 500), style: .grouped)
           return tableView
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.view.addSubview(self.closeButton)
        self.closeButton.center = self.view.center
        self.view.addSubview(self.titleLable)
        self.view.addSubview(self.orbitalLable)
        self.view.addSubview(self.tableView)
        
        makeData()
        
    }
    
    private func makeData() {
            DateConfig.dateConfig() { title in
                DispatchQueue.main.async {
                    self.titleLable.text = title
                }
            }
            
            planetDateConfig() { planet, errorText in
                DispatchQueue.main.async {
                    self.orbitalLable.text = planet?.orbital_period
                }
            }
            
            planetDateConfig() { planet, errorText in
                DispatchQueue.main.sync {
                    planet?.residents.forEach { people in
                        self.arrayOfPeople.append(people)
                    }
                }
            }
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
