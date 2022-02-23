//
//  BasicStepperViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/31.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicStepperViewController: UIViewController {

    private var label: UILabel!
    private var stepper: UIStepper!
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.text = "0"
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        label.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        self.view.addSubview(label)
        
        stepper = UIStepper()
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 2
        
        // UIStepper 按下不动时自动变化数值
        stepper.autorepeat = true
        
        // UIStepper 是否可以在变化时時同步执行selector
        // 如果是 false 时，则是放开按钮时才执行selector
        stepper.isContinuous = true
        
        /* 是否可以循环 */
        stepper.wraps = true
        
        stepper.addTarget(self, action: #selector(onStepperChange), for: UIControl.Event.valueChanged)
        
        stepper.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(stepper)
        
    }

    @objc private func onStepperChange() {
      
        label.text = "\(stepper.value)"
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
