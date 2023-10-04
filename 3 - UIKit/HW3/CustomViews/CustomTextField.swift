//
//  CustomTextField.swift
//  HW3
//
//  Created by Damir Nabiullin on 04.10.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 2, left: 15, bottom: 2, right: 15)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    private func setUpView() {
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 0.98, green: 0.5, blue: 0, alpha: 1)
    }
}
