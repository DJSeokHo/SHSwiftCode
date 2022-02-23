//
//  NotificationUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 18/08/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation
import UIKit

class NotificationUtility {
    
    public static func post(name: String, userInfo: Dictionary<AnyHashable, Any>) {
      
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: nil, userInfo: userInfo)
    }
    
    
    public static func post(name: String) {
      
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: nil, userInfo: nil)
    }
    
    public static func addObserver(name: String, observer: Any, selector: Selector) {
        
        NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
        
    }
    
    public static func removeAllObserver(observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    public static func navigationTo(from: UINavigationController?, target: AnyClass, animated: Bool) {
        
        let viewControllerList = from?.viewControllers ?? Array<UIViewController>()
        
        for viewController in viewControllerList {
            
            if viewController.isKind(of: target) {
                from?.popToViewController(viewController, animated: animated)
            }
            
        }
    }
}
