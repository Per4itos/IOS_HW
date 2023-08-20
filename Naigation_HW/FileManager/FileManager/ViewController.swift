//
//  ViewController.swift
//  FileManager
//
//  Created by Адхам Тангиров on 18.08.2023.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    var checkFirstPassword = ""
    
    let keychain = Keychain(service: "FileManager.password.token")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(keychain["password"] ?? "Not found keychain")
        
        setUpButton()
        
    }
    func setUpButton() {
        LoginButton.setTitle("EnterPassword", for: .normal)
    }
    
    func keyChain() {
        do {
            try keychain.set(checkFirstPassword, key: "password")
        } catch let error {
            printContent(error.localizedDescription)
        }
    }
    
    func removeKeyChain() {
        do {
            try keychain.remove("password")
        } catch let error {
            print("error \(error)")
        }
        
        
    }
    
    @IBAction func passButonAction(_ sender: Any) {
        
        if keychain["password"] == nil {
            if checkFirstPassword == "" {
                
                print("start", checkFirstPassword)
                
                if passwordTextField.text!.count < 4 {
                    let alert = UIAlertController(title: "Password must be 4 symbols or more", message: "Try again please", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                } else {
                    checkFirstPassword = passwordTextField.text ?? ""
                    passwordTextField.text = ""
                    LoginButton.setTitle("Repeat password", for: .normal)
                }
                print("finish", checkFirstPassword)
            } else {
                
                if passwordTextField.text != checkFirstPassword {
                    LoginButton.setTitle("Enter password", for: .normal)
                    checkFirstPassword = ""
                    let alert = UIAlertController(title: "Wrong Password", message: "Try again Please", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                    
                } else {
                    
                    LoginButton.setTitle("Enter password", for: .normal)
                    passwordTextField.text = ""
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyBoard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    keyChain()
                }
            }
            
        } else {
            
            if passwordTextField.text == keychain["password"] {
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
                self.navigationController?.pushViewController(nextViewController, animated: true)
                
            } else {
                
                let alert = UIAlertController(title: "Wrong password", message: "Try again please", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
                passwordTextField.text = ""
            }
        }
    }
}


