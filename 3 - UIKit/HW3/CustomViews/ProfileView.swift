//
//  ProfileView.swift
//  HW3
//
//  Created by Damir Nabiullin on 04.10.2023.
//

import UIKit

final class ProfileView: UIView {
    
    private let imageProfile = {
        var view = UIImageView()
        view.image = UIImage(named: "openh")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let nameLable = {
        var lable = UILabel()
        lable.textColor = .orange
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return lable
    }()
    
    private let surnameLable = {
        var lable = UILabel()
        lable.textColor = .purple
        lable.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: DefaultData) {
        updateInfo(name: data.name, surname: data.surname)
    }
    
    private func setUpView() {
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 0.98, green: 0.5, blue: 0, alpha: 1)
        
        addSubview(imageProfile)
        addSubview(nameLable)
        addSubview(surnameLable)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        surnameLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//          Image constaints
            NSLayoutConstraint(item: imageProfile, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageProfile, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: imageProfile, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.25,
                constant: 0),
            NSLayoutConstraint(item: imageProfile, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.5, constant: 0),
            
//          Name constaints
            NSLayoutConstraint(item: nameLable, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: nameLable, attribute: .leading, relatedBy: .equal, toItem: imageProfile, attribute: .trailing, multiplier: 1, constant: 10),
            
//          Price constaints
            NSLayoutConstraint(item: surnameLable, attribute: .top, relatedBy: .equal, toItem: nameLable, attribute: .bottom, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: surnameLable, attribute: .leading, relatedBy: .equal, toItem: imageProfile, attribute: .trailing, multiplier: 1, constant: 10)
        ])
    }
}

extension ProfileView {
    func updateInfo(name: String, surname: String) {
        nameLable.text = name
        surnameLable.text = surname
    }
}

