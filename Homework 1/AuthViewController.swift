//
//  AuthViewController.swift
//  Homework 1
//
//  Created by Руслан Канжарбеков on 30.03.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Name"
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        view.leftView = leftPaddingView
        view.leftViewMode = .always
        return view
    }()
    
    private lazy var surnameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Surname"
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        view.leftView = leftPaddingView
        view.leftViewMode = .always
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login", for: .normal)
        view.setTitleColor(.link, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameTextField)
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            surnameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 25),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        
        if !name.isEmpty && !surname.isEmpty {
            UserSessionManager.shared.startSession(name: name, surname: surname, phone: "+996508269520")
            showUserProfileScreen()
        } else {
            
        }
    }
    
    private func showUserProfileScreen() {
        let userProfileVC = UserProfileViewController()
        navigationController?.pushViewController(userProfileVC, animated: true)
    }
}

