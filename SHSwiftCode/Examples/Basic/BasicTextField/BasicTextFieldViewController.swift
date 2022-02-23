//
//  BasicTextFieldViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/21.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicTextFieldViewController: UIViewController, UITextFieldDelegate {

    private static let TAG: String = "BasicTextFieldViewController"
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addTextField()
    }
    
    private func addTextField() {
        
        let textField: UITextField = UITextField()
        
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.placeholder = "input please"
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        textField.keyboardType = UIKeyboardType.default
        
        textField.returnKeyType = UIReturnKeyType.done
        
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.lightGray
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        textField.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(textField)
        
        textField.delegate = self
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        ILog.debug(tag: BasicTextFieldViewController.TAG, content: "clear")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 隐藏键盘
//        self.view.endEditing(true)
        textField.resignFirstResponder()
        
        ILog.debug(tag: BasicTextFieldViewController.TAG, content: "return \(textField.text ?? "")")
        return true
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
