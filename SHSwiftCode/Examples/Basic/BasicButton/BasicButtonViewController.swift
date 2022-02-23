//
//  BasicButtonViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/22.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicButtonViewController: UIViewController {

    private static let TAG: String = "BasicButtonViewController"
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        var button: UIButton = UIButton(type: UIButton.ButtonType.contactAdd) as UIButton
        button.center = CGPoint(x: fullScreenSize.width * 0.4, y: fullScreenSize.height * 0.2)
        self.view.addSubview(button)
        
        
        button = UIButton(type: UIButton.ButtonType.infoLight) as UIButton
        button.center = CGPoint(x: fullScreenSize.width * 0.6, y: fullScreenSize.height * 0.2)
        self.view.addSubview(button)
        
        
        button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        button.setTitle("click me", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.isEnabled = true
        button.backgroundColor = UIColor.darkGray
        button.addTarget(self, action: #selector(self.onButtonClick), for: UIControl.Event.touchUpInside)
        button.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(button)
    }
    
    @objc func onButtonClick() {
        ILog.debug(tag: BasicButtonViewController.TAG, content: "onButtonClick")
        
        if self.view.backgroundColor!.isEqual(UIColor.white) {
            self.view.backgroundColor = UIColor.black
        }
        else {
            self.view.backgroundColor = UIColor.white
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
