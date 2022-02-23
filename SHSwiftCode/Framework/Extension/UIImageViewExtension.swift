//
//  UIImageViewExtension.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/09.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func roundedCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func circleClip() {
        layer.cornerRadius = bounds.width * 0.5
        clipsToBounds = true
    }
}
