//
//  BasicLabelViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/21.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicLabelViewController: UIViewController {

    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addLabel()
    }
    
    private func addLabel() {
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 80)
        label.text = "I am a label"
        
        label.textColor = UIColor.black
        label.font = UIFont(name: "Helvetica-Light", size: 20)
        label.textAlignment = NSTextAlignment.center
        
        label.numberOfLines = 1
        
        // 文字过多，省略尾部
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        label.shadowColor = UIColor.blue
        
        label.shadowOffset = CGSize(width: 2, height: 2)
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        label.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        label.backgroundColor = UIColor.orange
        self.view.addSubview(label)
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
