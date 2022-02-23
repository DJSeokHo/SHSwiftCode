//
//  AnimationUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/01/15.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation
import UIKit

class AnimationUtility {
    
    public static func shakeView(view: UIView) {
        
        let layer = view.layer
        let position = layer.position
        
        let start = CGPoint(x: position.x + 5, y: position.y);
        let end = CGPoint(x: position.x - 5, y: position.y);
        
        let basicAnimation = CABasicAnimation(keyPath: "position")
        basicAnimation.timingFunction = CAMediaTimingFunction(name: .default)
        basicAnimation.fromValue = start
        basicAnimation.toValue = end

        basicAnimation.autoreverses = true
        basicAnimation.duration = 0.06
        basicAnimation.repeatCount = 3
        
        layer.add(basicAnimation, forKey: nil)
        
    }
    
    public static func withoutAnimation(runnable: @escaping () -> Void) {
        UIView.performWithoutAnimation {
            runnable()
        }
    }
}
