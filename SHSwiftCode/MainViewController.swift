//
//  MainViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ILog.debug(tag: #file, content: "viewDidLoad")
        
        ThreadUtility.startThread {
            
            ThreadUtility.startUIThread(runnable: {
                
//                MapKitExampleViewController.start(from: self)
//                SIAHelloWorldViewController.start(from: self)
//                SIAStackLayoutViewController.start(from: self)
//                SIATableViewViewController.start(from: self)
//                SIACustomTableViewViewController.start(from: self)
                
//                StatusBarThemeExampleViewController.start(from: self)
                TopNavigationBarExampleViewController.start(from: self)
                
                HttpWrapper.requestGet(withUrl: "https://www.onnoffcompany.com/v1/main/keyword", success: {_ in 
                    
                }, fail: {_ in 
                    
                })
                
            }, afterSeconds: 1.5)
        }
        
      
    }
    

}

