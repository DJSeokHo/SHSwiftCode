//
//  BasicScrollViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/11/03.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

/**
 scroll view 4个 边固定
 加入 1个 UIView 作为 Content View
 Content View的4个边固定在ScrollView的ContentLayoutGuide上，值为0
 Content View的宽和ScrollView的FrameLayoutGuide一致
 Content View的高设置好
 Done
 */
class BasicScrollViewController: UIViewController {

    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        
        finish()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
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
