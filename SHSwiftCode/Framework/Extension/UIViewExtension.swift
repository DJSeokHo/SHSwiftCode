//
//  UIViewExtension.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/03/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func setOnTouchListener(_ target: Any?, action: Selector) {

        self.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(guestureRecognizer)
        
    }
    
    public func setShadow(view: UIView, color: CGColor, radius: CGFloat, opacity: Float, offsetWidth: Int = 0, offsetHeight: Int = 0) {
        
        view.layer.shadowColor = color
        view.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
        view.layer.shadowRadius = radius
        view.layer.shadowOpacity = opacity
        
    }
    
    public func setBlurEffect(style: UIBlurEffect.Style) {
        
        // Applying the blur effect
        // MARK: .dark、.light、.extraLight
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        addSubview(blurEffectView)
    }
   
}
