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
                SIAHelloWorldViewController.start(from: self)
//                SIAStackLayoutViewController.start(from: self)
//                SIATableViewViewController.start(from: self)
//                SIACustomTableViewViewController.start(from: self)
                
            }, afterSeconds: 1.5)
        }
        
      
    }
    

}

