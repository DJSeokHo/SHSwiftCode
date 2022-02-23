//
//  TabUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2020/04/28.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation
import UIKit

class TabUtility {
    
    public static func addTapListener(viewGroup: UIView, target targetView: UIView, action: Selector) {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: viewGroup, action: action)
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        
        targetView.isUserInteractionEnabled = true
        targetView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    public static func addTapListener(viewGroup: UIViewController, target targetView: UIView, action: Selector) {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: viewGroup, action: action)
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        
        targetView.isUserInteractionEnabled = true
        targetView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
}
