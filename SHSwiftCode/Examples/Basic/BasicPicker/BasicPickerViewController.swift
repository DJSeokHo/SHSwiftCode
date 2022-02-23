//
//  BasicPickerViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/25.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicPickerViewController: UIViewController {

    @IBAction func onButtonBasicPickerClick(_ sender: UIButton) {
        self.finish()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initPickerView()
        
    }
    
    private func initPickerView() {
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        let pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 0, y: fullScreenSize.height * 0.3, width: fullScreenSize.width, height: 150)
        
        let customPickerViewController = CustomPickerViewController()
        self.addChild(customPickerViewController)
        
        pickerView.delegate = customPickerViewController
        pickerView.dataSource = customPickerViewController
        
        self.view.addSubview(pickerView)
        
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
