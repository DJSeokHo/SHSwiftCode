//
//  BasicSwitchViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/28.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicSwitchViewController: UIViewController {

    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fullScreenSize = DisplayUtility.getFullScreenSize()
           
        let switchOne = UISwitch()

        switchOne.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        self.view.addSubview(switchOne)



        let switchTwo = UISwitch()

        switchTwo.thumbTintColor = UIColor.orange

        // 设置 off 时的外观
        switchTwo.tintColor = UIColor.blue

        // 设置 on 时的外观
        switchTwo.onTintColor = UIColor.brown


        switchTwo.addTarget(self, action: #selector(self.onChange), for: UIControl.Event.valueChanged)
  
        switchTwo.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        
        self.view.addSubview(switchTwo)
    }

    
    @objc private func onChange(sender: AnyObject) {
        
        let tempSwitch = sender as! UISwitch

       
        if tempSwitch.isOn {
            
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
