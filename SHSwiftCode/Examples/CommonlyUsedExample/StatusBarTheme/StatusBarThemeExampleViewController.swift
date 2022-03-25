//
//  StatusBarThemeExampleViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/03/25.
//

import UIKit

class StatusBarThemeExampleViewController: UIViewController {

    public static func start(from parentViewController: UIViewController) {
        
        let viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "StatusBarThemeExampleViewController", withClassName: "StatusBarThemeExampleViewController") as! StatusBarThemeExampleViewController
        
        parentViewController.presentUIViewController(target: viewController, withNavigation: true)
//        parentViewController.presentUIViewController(target: viewController, withNavigation: false)
    }
    
    var isLightTheme = true
    
    /**
     if this UIViewController without UINavigationController
     use this
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    /**
     if this UIViewController with UINavigationController
     use this
     change status bar theme dynamically
     */
    @IBAction func onButtonClick(_ sender: Any) {
        
        isLightTheme = !isLightTheme
        
        if isLightTheme {
            view.backgroundColor = UIColor.white
            setStatusBarTheme(isDark: false)
        }
        else {
            view.backgroundColor = UIColor.black
            setStatusBarTheme(isDark: true)
        }

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
