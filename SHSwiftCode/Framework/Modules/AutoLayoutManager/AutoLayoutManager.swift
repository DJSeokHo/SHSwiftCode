//
//  AutoLayoutManager.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/03/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation
import UIKit

class AutoLayoutManager {
    
    public static let instance = AutoLayoutManager()
    private init() {}
    
    
    public func createLayoutConstraintHeight(view: UIView) -> NSLayoutConstraint {
        let layoutConstrain = view.heightAnchor.constraint(equalToConstant: view.frame.height)
        layoutConstrain.isActive = true
        
        return layoutConstrain
    }
    
    public func createLayoutConstraintHeight(view: UIView, height: CGFloat) -> NSLayoutConstraint {
        let layoutConstrain = view.heightAnchor.constraint(equalToConstant: height)
        return layoutConstrain
    }
    
    public func toggleLayoutConstraintHeight(layoutConstraintHeight: NSLayoutConstraint, andWitchViewWillBeChange view: UIView, plusWillBeTrueAndMinusWillBeFalse operation: Bool, andValueIs value: CGFloat) {
        
        layoutConstraintHeight.constant = operation ? view.frame.height + value : view.frame.height - value
    }
    
    public func toggleLayoutConstraintHeight(layoutConstraintHeight: NSLayoutConstraint, operation: Bool, andValueWhenTrueIs tValue: CGFloat, andValueWhenFalseIs fValue: CGFloat) {
        
        layoutConstraintHeight.constant = operation ? tValue : fValue
    }
    
    public func startToggleAnimation(view: UIView, withDuration duration: TimeInterval, completion: ((Bool) -> Void)?) {
        
        UIView.animate(withDuration: duration, animations: {
            
            view.layoutIfNeeded()
            
        }, completion: completion)
    }
}
