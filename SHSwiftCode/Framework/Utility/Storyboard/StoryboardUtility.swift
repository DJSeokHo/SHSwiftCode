//
//  StoryboardUtility.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/04.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation
import UIKit

class StoryboardUtility {
    
    static func findStoryboard(name: String, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: bundle)
    }
    
    static func findViewControllerFromStoryboard(storyboard:UIStoryboard, withClassName: String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: withClassName)
    }
    
    static func findViewControllerFromStoryboard(storyboardName:String, withClassName: String, bundle: Bundle? = nil) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: bundle).instantiateViewController(withIdentifier: withClassName)
    }
}

