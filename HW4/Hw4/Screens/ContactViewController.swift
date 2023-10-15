//
//  ContactViewController.swift
//  Hw4
//
//  Created by Damir Nabiullin on 15.10.2023.
//

import UIKit

class ContactViewController: UIViewController {
    
    private var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        
        return label
    }()
    
    private var contactData: ContactInformation?
    
    init(contactData: ContactInformation) {
        self.contactData = contactData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contactData = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure(contactData: contactData)
        
        setUpView()
    }
    
    private func configure(contactData: ContactInformation?) {
        imageView.image = contactData?.avatar
        nameLabel.text = contactData?.fullName
    }
    
    private func setUpView() {
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Image constraints
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Name lable constraints
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
