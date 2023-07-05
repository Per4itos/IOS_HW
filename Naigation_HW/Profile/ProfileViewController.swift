//
//  ProfileViewController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "TableHeader")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    var post2 = postSetup
    var post3 = headerSetup

    private let profile = Profile1(name: "Hipster Cat", text: "Waiting for something...")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        self.view.addSubview(self.tableView)
        self.setupHeader()
        self.navigationController?.navigationBar.backgroundColor = .white
        
#if DEBUG
        self.view.backgroundColor = .yellow
        
#else
        self.view.backgroundColor = .red
        
#endif
        
        
    }
    
    private func setupHeader() {
        
        NSLayoutConstraint.activate([
            
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 95),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return self.post2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == .zero {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableHeader", for: indexPath) as! PhotosTableViewCell
            let post = post3[indexPath.row]
            cell.setup(with: post)
            
            return cell
        }else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! PostTableViewCell
            let post = postSetup[indexPath.row]
            
            cell.setup(with: post)
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == .zero {
            return 150
        }
        return 600
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == .zero {
            let destination = PhotosViewController()
            navigationController?.pushViewController(destination, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! ProfileHeaderView
            header.setup(with: profile)
            return header
        } else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        }else{
            return 0
        }
        
    }
    
    
}









    
    
    
