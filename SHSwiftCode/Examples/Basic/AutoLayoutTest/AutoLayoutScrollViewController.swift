//
//  AutoLayoutScrollViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/03/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class AutoLayoutScrollViewController: UIViewController {

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var viewTop: UIView!
    @IBOutlet var button: UIButton!
    
    private var isBig = true
    
    private var heightConstrains: NSLayoutConstraint!
    private var viewTopHeightConstrains: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initArchon()
        
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
    }
    @objc private func onButtonClick() {
      
        isBig = !isBig
        
        heightConstrains.constant = isBig ? 60 : 20
        viewTopHeightConstrains.constant = isBig ? viewTop.frame.height + 40 : viewTop.frame.height - 40
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    private func initArchon() {
        
        heightConstrains = labelTitle.heightAnchor.constraint(equalToConstant: labelTitle.frame.height)
        heightConstrains.isActive = true
        
        viewTopHeightConstrains = viewTop.heightAnchor.constraint(equalToConstant: viewTop.frame.height)
        viewTopHeightConstrains.isActive = true
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
