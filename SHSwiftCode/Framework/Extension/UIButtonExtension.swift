//
//  UIButtonExtension.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/04.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    public func padding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.contentEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func setOnClickListener(_ target: Any?, action: Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }
}
