//
//  TopNavigationBarExampleViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/03/25.
//

import UIKit

class TopNavigationBarExampleViewController: UIViewController {

    public static func start(from parentViewController: UIViewController) {
        
        let viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "TopNavigationBarExampleViewController", withClassName: "TopNavigationBarExampleViewController") as! TopNavigationBarExampleViewController
        
        parentViewController.presentUIViewController(target: viewController, withNavigation: true)
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
