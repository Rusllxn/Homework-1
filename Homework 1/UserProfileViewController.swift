//
//  UserProfileViewController.swift
//  Homework 1
//
//  Created by Руслан Канжарбеков on 30.03.2024.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var surnameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var phoneLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        updateUserData()
    }
    
    // MARK: - Layout Setup
    private func setupLayout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(surnameLabel)
        stackView.addArrangedSubview(phoneLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func updateUserData() {
        let sessionManager = UserSessionManager.shared
        if let name = sessionManager.getName() {
            nameLabel.text = "Name: \(name)"
        }
        if let surname = sessionManager.getSurname() {
            surnameLabel.text = "Surname: \(surname)"
        }
        if let phone = sessionManager.getPhone() {
            phoneLabel.text = "Phone: \(phone)"
        }
    }
}
