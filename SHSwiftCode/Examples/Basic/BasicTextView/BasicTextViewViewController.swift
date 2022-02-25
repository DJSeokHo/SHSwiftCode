 //
//  BasicTextViewViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/22.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicTextViewViewController: UIViewController, UITextViewDelegate {

    private static let TAG: String = "BasicTextViewViewController"
    
    var textView: UITextView?
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addCustomTextView()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /* 点击空白处隐藏键盘 */
        tapSpaceToEndEditing()
    }
    
    private func addCustomTextView() {
        
        textView = UITextView()
        
        textView!.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
        
        textView!.backgroundColor = UIColor.darkGray
        textView!.textColor = UIColor.white
        
        textView!.font = UIFont(name: "Helvetica-Light", size: 20)
        
        textView!.textAlignment = NSTextAlignment.left
        
        textView!.text = "haha"
        
        textView!.keyboardType = UIKeyboardType.default
        textView!.returnKeyType = UIReturnKeyType.default
        
        textView!.isEditable = true
        textView!.isSelectable = true
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()

        textView!.center = CGPoint( x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)

        self.view.addSubview(textView!)
        
        
        // 定义选取文字后弹出的菜单按钮项
        let mailMenuItemAfterSelectContentOfTextView = UIMenuItem(title: "mail", action: #selector(self.onMenuMailClick))
        
        let menu = UIMenuController.shared
        
        menu.menuItems = [mailMenuItemAfterSelectContentOfTextView]
    }
    
    @objc private func onMenuMailClick() {
        print("onMenuMailClick")
    }

    @objc func hideKeyboard() {
        
        // 除了用 self.view.endEditing(true)
        // 也可以用 resignFirstResponder()
        ILog.debug(tag: BasicTextViewViewController.TAG, content: self.textView!.text ?? "")
        self.textView!.resignFirstResponder()
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
