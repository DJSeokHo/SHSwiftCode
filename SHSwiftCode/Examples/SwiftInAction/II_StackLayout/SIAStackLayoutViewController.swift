//
//  SIAStackLayoutViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/04.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class SIAStackLayoutViewController: UIViewController {
    
    public static func start(from parentViewController: UIViewController, withStoryboard: Bool = true) {
        
        var viewController: UIViewController
        
        if withStoryboard {
            viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "SIAStackLayout", withClassName: "SIAStackLayoutViewController") as! SIAStackLayoutViewController
        }
        else {
            viewController = SIAStackLayoutViewController()
        }
        
        parentViewController.presentUIViewController(target: viewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
