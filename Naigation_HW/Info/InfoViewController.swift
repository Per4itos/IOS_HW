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
    
    var namesP = [String]()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 105, y: 650, width: 200, height: 50))
        button.setTitle("Go in", for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        
        return button
    }()
    
    private lazy var titleLable: UILabel = {
       let titleLable = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
        
        return titleLable
    }()
    
    private lazy var orbitalLable: UILabel = {
       let orbitableLable = UILabel(frame: CGRect(x: 13, y: 50, width: 379, height: 50))
        orbitableLable.numberOfLines = 0
        orbitableLable.font = orbitableLable.font.withSize(15)
        return orbitableLable
    }()
    
    private lazy var tableTitleLabel: UILabel = {
            let tableTitleLabel = UILabel(frame: CGRect(x: 13, y: 100, width: 379, height: 50))
            tableTitleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            return tableTitleLabel
        }()
    
    private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: CGRect(x: 16, y: 140 , width: 362, height: 450), style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NamesTableViewCell.self, forCellReuseIdentifier: "NamesCell")
           return tableView
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.view.addSubview(self.closeButton)
//        self.closeButton.center = self.view.center
        self.view.addSubview(self.titleLable)
        self.view.addSubview(self.orbitalLable)
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.tableTitleLabel)
        
        makeData()
        
    }
    
    private func makeData() {
            DateConfig.dateConfig() { [weak self] title in
                DispatchQueue.main.async {
                    self?.titleLable.text = title
                }
            }
            
            planetDateConfig() { [weak self] planet, errorText in
                DispatchQueue.main.async {
                    self?.orbitalLable.text = planet!.orbital_period
                    self?.tableTitleLabel.text = planet!.name
                
                }
            }
            
        planetDateConfig() { planet, errorText in
                DispatchQueue.main.sync {
                    
                    planet?.residents.forEach { [weak self] people in
                        self?.arrayOfPeople.append(people)
                    }
                    for urls in planet!.residents {
                                    peopleDateConfig(for: urls) { peoplesOnPlanet, textError in
                                        DispatchQueue.main.async {
                                            self.namesP.append(peoplesOnPlanet?.name ?? "")
                                            self.tableView.reloadData()
                                        }
                                    }
                                }
                            
//
//                    for urls in self.arrayOfPeople {
//                        peopleDateConfig(for: urls) { [weak self] peoplesOnPlanet, textError in
//                            DispatchQueue.main.async {
//                                self?.namesP.append(peoplesOnPlanet?.name ?? "Loading...")
//                                self?.tableView.reloadData()
//                            }
//                        }
//                    }
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

extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        namesP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NamesCell", for: indexPath) as! NamesTableViewCell
        
        cell.setupName(names: namesP[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
