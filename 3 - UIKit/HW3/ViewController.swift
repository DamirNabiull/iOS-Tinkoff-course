//
//  ViewController.swift
//  HW3
//
//  Created by Damir Nabiullin on 04.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var profileView = ProfileView()
    
    private var nameTextField = {
        var textField = CustomTextField()
        textField.placeholder = "Name"
        textField.textColor = .purple
        textField.tintColor = .purple
        
        return textField
    }()
    
    private var surnameTextField = {
        var textField = CustomTextField()
        textField.placeholder = "Surname"
        textField.textColor = .purple
        textField.tintColor = .purple
        
        return textField
    }()
    
    private var updateButton = {
        var button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.backgroundColor = .orange
        button.setTitle("Update", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        print("viewDidLoad")
    }

    private func setUpView() {
        view.backgroundColor = .white
        
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(profileView)
        view.addSubview(updateButton)
        setUpLayout()
        
        profileView.configure(with: DefaultData())
        
        updateButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setUpLayout() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//          Name field constraints
            NSLayoutConstraint(item: nameTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: nameTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: nameTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50),
            
//          Surname field constraints
            NSLayoutConstraint(item: surnameTextField, attribute: .top, relatedBy: .equal, toItem: nameTextField, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: surnameTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: surnameTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: surnameTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50),
            
//          Profile view constraints
            NSLayoutConstraint(item: profileView, attribute: .top, relatedBy: .equal, toItem: surnameTextField, attribute: .bottom, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: profileView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: profileView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: profileView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150),
            
//          Button constraints
            NSLayoutConstraint(item: updateButton, attribute: .top, relatedBy: .equal, toItem: profileView, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: updateButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40),
            NSLayoutConstraint(item: updateButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -40),
            NSLayoutConstraint(item: updateButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
    }
    
    @objc func buttonAction() {
        profileView.updateInfo(name: nameTextField.text ?? "", surname: surnameTextField.text ?? "")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Logs

extension ViewController {
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
}

