//
//  FeedViewController.swift
//  Naigation_HW
//
//  Created by macOS on 03.09.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var loginInspectr: LoginInspector
    
    init(loginInspectr: LoginInspector) {
        
        self.loginInspectr = loginInspectr
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var checkGuessLable: UILabel = {
        let checkGuessLable = UILabel()
        checkGuessLable.translatesAutoresizingMaskIntoConstraints = false
        
        return checkGuessLable
    }()
    
    
    private lazy var checkGuessButton = CustonButton(title: "checkGuessButton", titleColor: .white, buttonColor: .blue, buttonCornRadius: 4, shadow: false, tapAction: checkGuessButtonAction)
    
    private lazy var  checkGuessTextField: UITextField = {
        let checkGuessTextField = UITextField()
        checkGuessTextField.translatesAutoresizingMaskIntoConstraints = false
        checkGuessTextField.textColor = .systemGray
        checkGuessTextField.placeholder = "Check"
        
        return checkGuessTextField
    }()
    
    private lazy var button = CustonButton(title: "Go IN", titleColor: .white, buttonColor: .blue, buttonCornRadius: 4, shadow: false, tapAction: buttonAction)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(self.button)
        self.view.addSubview(self.checkGuessLable)
        self.view.addSubview(self.checkGuessTextField)
        self.view.addSubview(self.checkGuessButton)
        
        let leftbutton = UIButton()
        
        leftbutton.setImage(UIImage(systemName: "arrowshape.left"), for: .normal)
        leftbutton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        let reloadBarItem = UIBarButtonItem(customView: leftbutton)
        
        navigationItem.leftBarButtonItem = reloadBarItem
        
        NSLayoutConstraint.activate([
            
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button.heightAnchor.constraint(equalToConstant: 50),
            self.button.widthAnchor.constraint(equalToConstant: 350),
            
            self.checkGuessTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.checkGuessTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.checkGuessTextField.heightAnchor.constraint(equalToConstant: 30),
            self.checkGuessTextField.widthAnchor.constraint(equalToConstant: 200),
            
            self.checkGuessButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.checkGuessButton.topAnchor.constraint(equalTo: self.checkGuessTextField.bottomAnchor, constant: 16),
            self.checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            self.checkGuessButton.widthAnchor.constraint(equalToConstant: 200),
            
            self.checkGuessLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.checkGuessLable.topAnchor.constraint(equalTo: self.checkGuessButton.bottomAnchor, constant: 16),
            self.checkGuessLable.heightAnchor.constraint(equalToConstant: 30),
            self.checkGuessLable.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    @objc private func checkGuessButtonAction() {
        
        let check = FeedModel()
        
        if check.chec(word: checkGuessTextField.text!) == true{
            self.checkGuessLable.backgroundColor = .green
        }else {
            self.checkGuessLable.backgroundColor = .red
        }
    }
    
    @objc private func logOut() {
        let keyWindow = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .last { $0.isKeyWindow }
        
        guard let window = keyWindow else {
            return
        }
        
        window.rootViewController = LogInViewController(loginInspectr: loginInspectr)
    }
    
    @objc private func buttonAction() {
        
        let postViewController = PostViewController()
        
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
}
