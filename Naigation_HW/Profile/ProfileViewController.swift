//
//  ProfileViewController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit
import SwiftEntryKit
import Firebase
import FirebaseCore
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    var coordinator: ProfileCoordinator?

    var user: User
    
    var timer: Timer?
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "TableHeader")
        tableView.register(AudioTableViewCell.self, forCellReuseIdentifier: "AudioTable")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    var post2 = postSetup
    var post = headerSetup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        self.view.addSubview(self.tableView)
        self.setupHeader()
        self.navigationController?.navigationBar.backgroundColor = .white
        self.premiumAllert()
        
#if DEBUG
        self.view.backgroundColor = .yellow
        
#else
        self.view.backgroundColor = .red
        
#endif
    }
    
    func timerPremiumAllert() {

           timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(premiumAllert), userInfo: nil, repeats: false)
        }

        deinit {
            timer?.invalidate()
        }

        @objc private func premiumAllert() {
            SwiftEntryKit.display(entry: CustomAlertView(image: user.image, name: "Hey, \(user.name)! we have free Primium Subscribe for you"), using: setupAttributes())
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
        } else if section == 1 {
            return 1
        }
        return self.post2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "AudioTable", for: indexPath) as! AudioTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        }else if indexPath.section == 1 {
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableHeader", for: indexPath) as! PhotosTableViewCell
            let post = post[indexPath.row]
            cell.setup(with: post)
            
            return cell
        }else  {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! PostTableViewCell
            let post = postSetup[indexPath.row]
            
            cell.setup(with: post)
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == .zero {
            return 50
        } else if indexPath.section == 1 {
            return 150
        }
        return 600
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let audioTap = AudioViewCiontroller()
            navigationController?.pushViewController(audioTap, animated: true)
        }else if indexPath.section == 1 {
            let destination = PhotosViewController()
            navigationController?.pushViewController(destination, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! ProfileHeaderView
            header.setup(with: user)
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












