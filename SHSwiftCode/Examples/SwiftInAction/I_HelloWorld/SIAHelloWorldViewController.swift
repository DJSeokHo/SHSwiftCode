//
//  SIAHelloWorldViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/04.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class SIAHelloWorldViewController: UIViewController {
    
    public static func start(from parentViewController: UIViewController, withStoryboard: Bool = true) {
        
        var viewController: UIViewController
        
        if withStoryboard {
            viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "SIAHelloWorld", withClassName: "SIAHelloWorldViewController") as! SIAHelloWorldViewController
        }
        else {
            viewController = SIAHelloWorldViewController()
        }
        
        parentViewController.presentUIViewController(target: viewController)
    }
    
  
    @IBOutlet var buttonHelloWorld: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setListener()
    }
    
    private func setListener() {
        
        buttonHelloWorld.setOnClickListener(self, action: #selector(onButtonHelloWorldClick))
    }
    
    @objc private func onButtonHelloWorldClick() {
        self.showAlert(title: "Welcome to My First App", message: "Hello World", confirmTitle: "OK")
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
