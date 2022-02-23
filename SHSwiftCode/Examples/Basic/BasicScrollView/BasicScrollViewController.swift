//
//  BasicScrollViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/11/03.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicScrollViewController: UIViewController {

    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        
        finish()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: contentView.frame.size.width, height: contentView.frame.size.height)
        
        
        scrollView.addSubview(contentView)
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
