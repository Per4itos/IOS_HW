//
//  SettingsViewController.swift
//  FileManager
//
//  Created by Адхам Тангиров on 20.08.2023.
//

import UIKit
import KeychainAccess

class SettingsViewController: UIViewController {
    
    var tableViewDelegate: TableViewController?
    let  keychain = Keychain(service: "FileManager.password.token")
    
    
    @IBOutlet weak var sortSwitch: UISwitch!
    
    @IBOutlet weak var passwordChacge: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "sortValue") {
            sortSwitch.setOn(true, animated: false)
        } else {
            sortSwitch.setOn(false, animated: false)
        }
        
        sortSwitch.addTarget(self, action: #selector(sortSwitchAction), for: .valueChanged)
        
    }
    
    
    @IBAction func sortSwitchAction(_ sender: Any) {
    
        if sortSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "sortValue")
            print("Sort enabled")
        } else {
            UserDefaults.standard.set(false, forKey: "sortValue")
            print("Sort disabled")
        }
        
        tableViewDelegate?.tableView.reloadData()
        
    }
    
    @IBAction func changePasswordAction(_ sender: Any) {
    
        let alert = UIAlertController(title: "Chancge Password", message: "Enter a new password", preferredStyle: .alert)
        
        let cancleAlert = UIAlertAction(title: "Cancle", style: .cancel) { (alertAction) in }
        alert.addAction(cancleAlert)
        
        alert.addTextField() { field in
            field.placeholder = "Enter a new password"
            
        }
        
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            guard let field = alert.textFields else { return }
            
            let newPasswordField = field[0]
            
            guard let newPassword = newPasswordField.text , !newPassword.isEmpty else { return }
            
            if newPassword.count >= 4 {
                
                do {
                    try self.keychain.set(newPassword, key: "password")
                    let alert = UIAlertController(title: "Succes!", message: "New Password saved", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                let alert = UIAlertController(title: "Password must be 4 symbols or more", message: "Try again please", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
            }
        }
        alert.addAction(save)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
   
