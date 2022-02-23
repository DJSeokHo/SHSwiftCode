//
//  BasicSegmentViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/30.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicSegmentViewController: UIViewController {

    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        let segment = UISegmentedControl(items: ["a", "b", "c", "d"])
        
        segment.tintColor = UIColor.black
        segment.backgroundColor = UIColor.lightGray
        segment.selectedSegmentIndex = 0
        
        segment.addTarget(self, action: #selector(onSegmentValueChanged), for: UIControl.Event.valueChanged)
        
        segment.frame.size = CGSize(width: fullScreenSize.width * 0.8, height: 30)
        segment.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.25)
        
        self.view.addSubview(segment)
    }
    
    @objc private func onSegmentValueChanged(sender: UISegmentedControl) {
        
        print("\(sender.selectedSegmentIndex) \(sender.titleForSegment(at: sender.selectedSegmentIndex)!)")

        print()
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
