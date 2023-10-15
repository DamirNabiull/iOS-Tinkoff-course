//
//  ContactCollectionViewCell.swift
//  Hw4
//
//  Created by Damir Nabiullin on 15.10.2023.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {

    private var cellContactName: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        
        return label
    }()
    
    private var cellAvatar: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }
    
    private func setUpView() {
        layer.borderColor = CGColor(red: 0.5, green: 0, blue: 0.5, alpha: 0.5)
        layer.borderWidth = 1
        
        contentView.addSubview(cellAvatar)
        contentView.addSubview(cellContactName)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        cellAvatar.translatesAutoresizingMaskIntoConstraints = false
        cellContactName.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Avatar layout
            cellAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cellAvatar.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            cellAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellAvatar.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            // Name layout
            cellContactName.leftAnchor.constraint(equalTo: cellAvatar.rightAnchor, constant: 15),
            cellContactName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(_ data: ContactInformation) {
        cellAvatar.image = data.avatar
        cellContactName.text = data.fullName
    }
}
