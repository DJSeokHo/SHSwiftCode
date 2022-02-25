//
//  RoundedTextField.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/25.
//

import UIKit

class RoundedTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let paddingInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        // 文字区域 内边距
        return bounds.inset(by: paddingInset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        // 占位符 内边距
        return bounds.inset(by: paddingInset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        // 可编辑文字 内边距
        return bounds.inset(by: paddingInset)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.systemGray5.cgColor
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
}
