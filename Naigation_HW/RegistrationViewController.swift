//
//  RegistrationViewController.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 08.08.2023.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
    
    
    private lazy var titleLable: UILabel = {
       let titleLable = UILabel()
        titleLable.text = "Registration"
        titleLable.translatesAutoresizingMaskIntoConstraints = false

        return titleLable
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone"
        loginTextField.textColor = .black
        loginTextField.font = .systemFont(ofSize: 16, weight: .regular)
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemGray6
        loginTextField.tintColor = .darkGray
        loginTextField.borderStyle = .roundedRect
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return loginTextField
    }()
    
    private lazy var passwordtextField: UITextField = {
        let passwordtextField = UITextField()
        passwordtextField.placeholder = "Password"
        passwordtextField.textColor = .black
        passwordtextField.font = .systemFont(ofSize: 16, weight: .regular)
        passwordtextField.autocapitalizationType = .none
        passwordtextField.isSecureTextEntry = false
        passwordtextField.backgroundColor = .systemGray6
        passwordtextField.tintColor = .darkGray
        passwordtextField.borderStyle = .roundedRect
        passwordtextField.translatesAutoresizingMaskIntoConstraints = false
        

        return passwordtextField
    }()
    
    private lazy var regButton = CustomButton(title: "Registrate", titleColor: .black, buttonColor: .blue, buttonCornRadius: 10, shadow: false, tapAction: regButtonAction)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        setupView()
      
    }
    
    
    private func setupView() {
       
        view.addSubview(self.loginTextField)
        view.addSubview(self.passwordtextField)
        view.addSubview(self.titleLable)
        view.addSubview(self.regButton)
        
        NSLayoutConstraint.activate([

            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            loginTextField.widthAnchor.constraint(equalToConstant: 150),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordtextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordtextField.heightAnchor.constraint(equalToConstant: 30),
            passwordtextField.widthAnchor.constraint(equalToConstant: 150),
            passwordtextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            titleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            regButton.topAnchor.constraint(equalTo: passwordtextField.bottomAnchor, constant: 20),
            regButton.heightAnchor.constraint(equalToConstant: 50),
            regButton.widthAnchor.constraint(equalToConstant: 200),
            regButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    
        ])
    }
    
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let logInButtonBottomPointY =  self.regButton.frame.origin.y + self.regButton.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            _ = keyboardOriginY <= logInButtonBottomPointY
            ? logInButtonBottomPointY - keyboardOriginY + 16
            : 0
            
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.hideKeyboard()
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
        
    }
    
    @objc private func regButtonAction() {
        
        let checkerService = CheckerService()
        checkerService.signUp(for: loginTextField.text!, and: passwordtextField.text!) {  result in
            
            switch result {
        case .success(let user):
            
            let tabBarController = UITabBarController()
            
            let feedViewController = UINavigationController(rootViewController: FeedViewController())
            let profaileViewControler = UINavigationController(rootViewController: ProfileViewController(user: user))
            
            tabBarController.viewControllers = [
                profaileViewControler,
                feedViewController
            ]
            
            tabBarController.viewControllers?.enumerated().forEach {
                $1.tabBarItem.title = $0 == 0 ? "Profile" : "Feed"
                $1.tabBarItem.image = $0 == 0
                ? UIImage(systemName: "person.icloud")
                : UIImage(systemName: "text.justify")
            }
            
            let keyWindow = UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .last { $0.isKeyWindow }
            
            guard let window = keyWindow else {
                return
            }
            
            window.rootViewController = tabBarController
            
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
            
            
        case .failure(let error):
         
                
            print("Error of date \(error)")
        }
        }
        
    }
    
}


