//
//  LogInViewController.swift
//  Naigation_HW
//
//  Created by macOS on 08.09.2022.
//

import UIKit

final class LogInViewController: UIViewController  {
    
    var coordinator: LoginCoordinator?
    
    var loginInspectr: LoginInspector
    
    init(loginInspectr: LoginInspector) {
        
        self.loginInspectr = loginInspectr
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var currentLogIn = CurrentUserService()
    var testLogIn = TestUserSercive()
    var user: User?
    
    
    
    let imageVk = UIImage(named: "logovk" )
    
    private lazy var scroleView: UIScrollView = {
        let scroleView = UIScrollView()
        scroleView.translatesAutoresizingMaskIntoConstraints = false
        
        return scroleView
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = imageVk
        
        return image
    }()
    
    private lazy var textStackView: UIStackView = {
        let textStackView = UIStackView()
    
        textStackView.distribution = .fillEqually
        textStackView.axis = .vertical
        textStackView.layer.borderColor = UIColor.lightGray.cgColor
        textStackView.layer.borderWidth = 0.5
        textStackView.layer.cornerRadius = 10
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return textStackView
    }()
    
    private lazy var logInTextField: UITextField = {
        let logInText = UITextField()
        
        logInText.text = Checker.shared.login
        logInText.placeholder = "Email or phone"
        logInText.textColor = .black
        logInText.font = .systemFont(ofSize: 16, weight: .regular)
        logInText.autocapitalizationType = .none
        logInText.backgroundColor = .systemGray6
        logInText.tintColor = .darkGray
        logInText.borderStyle = .roundedRect
        logInText.translatesAutoresizingMaskIntoConstraints = false
        
        return logInText
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordText = UITextField()
        
        passwordText.text = Checker.shared.password
        passwordText.placeholder = "Password"
        passwordText.textColor = .black
        passwordText.font = .systemFont(ofSize: 16, weight: .regular)
        passwordText.autocapitalizationType = .none
        passwordText.isSecureTextEntry = true
        passwordText.backgroundColor = .systemGray6
        passwordText.tintColor = .darkGray
        passwordText.borderStyle = .roundedRect
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordText
    }()
    
    private lazy var logInButton : UIButton = {
        let logInButton = UIButton()
        
        logInButton.layer.cornerRadius = 10
        logInButton.addTarget(self, action: #selector(self.buttonAction2), for: .touchUpInside)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: UIControl.State.normal)
        logInButton.clipsToBounds = true
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.setupGesture()
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.logInTextField.becomeFirstResponder()
    }
    
    private func setUpViews() {
        view.backgroundColor = .systemBackground
        self.view.addSubview(self.scroleView)
        self.scroleView.addSubview(self.textStackView)
        self.scroleView.addSubview(self.logInButton)
        self.scroleView.addSubview(self.imageView)
        self.textStackView.addSubview(self.logInTextField)
        self.textStackView.addSubview(self.passwordTextField)
        
        NSLayoutConstraint.activate([
            
            self.scroleView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scroleView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.scroleView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scroleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            self.imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.111607),
            self.imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.241546),
            
            self.textStackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 120),
            self.textStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            self.textStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.textStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.111607),
            
            self.logInTextField.topAnchor.constraint(equalTo: self.textStackView.topAnchor),
            self.logInTextField.leftAnchor.constraint(equalTo: self.textStackView.leftAnchor),
            self.logInTextField.rightAnchor.constraint(equalTo: self.textStackView.rightAnchor),
            self.logInTextField.bottomAnchor.constraint(equalTo: self.passwordTextField.topAnchor),
            self.logInTextField.heightAnchor.constraint(equalTo: self.textStackView.heightAnchor, multiplier: 0.5),
            
            
            self.passwordTextField.bottomAnchor.constraint(equalTo: self.textStackView.bottomAnchor),
            self.passwordTextField.leftAnchor.constraint(equalTo: self.logInTextField.leftAnchor),
            self.passwordTextField.rightAnchor.constraint(equalTo: self.logInTextField.rightAnchor),
            self.passwordTextField.topAnchor.constraint(equalTo: self.logInTextField.bottomAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.textStackView.heightAnchor, multiplier: 0.5),
            
            self.logInButton.topAnchor.constraint(equalTo: self.textStackView.bottomAnchor, constant: 16),
            self.logInButton.rightAnchor.constraint(equalTo: self.textStackView.rightAnchor),
            self.logInButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.0558036),
            self.logInButton.leftAnchor.constraint(equalTo: self.textStackView.leftAnchor),
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let logInButtonBottomPointY =  self.logInButton.frame.origin.y + self.logInButton.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let offset = keyboardOriginY <= logInButtonBottomPointY
            ? logInButtonBottomPointY - keyboardOriginY + 16
            : 0
            
            self.scroleView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.hideKeyboard()
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
        self.scroleView.setContentOffset(.zero, animated: true)
    }
    
    @objc private func buttonAction2() {
        
        if loginInspectr.check(log: logInTextField.text!, pass: passwordTextField.text!) == true {
            let user = User(logIn: "adham", name: "adham", image: UIImage(named: "image3")!, status: "active")
            
            let tabBarController = UITabBarController()
            
            let feedViewController = UINavigationController(rootViewController: FeedViewController(loginInspectr: loginInspectr))
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
            
        }else {
            print ("Не правильно введен логин или пароль")
            
            let alert = UIAlertController(title: "Incorrect login", message: "Please, enter correct login", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel))
            self.present(alert, animated: true)
        }
    }
}
