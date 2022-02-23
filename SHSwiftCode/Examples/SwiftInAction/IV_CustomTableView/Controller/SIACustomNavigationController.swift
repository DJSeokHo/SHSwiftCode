//
//  SIACustomNavigationController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/17.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class SIACustomNavigationController: UINavigationController {

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }
    
    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

}
