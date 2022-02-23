//
//  AutoStackViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/02/02.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class AutoStackViewController: UIViewController {

    @IBOutlet var viewRed: UIView!
    @IBOutlet var viewBlue: UIView!
    @IBOutlet var viewOrange: UIView!
    
    @IBOutlet var viewVStack: UIStackView!
    @IBOutlet var viewTestOne: UIView!
    
    
    
    @IBOutlet var viewTestTwo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the
        
        
//        self.view.addSubview(viewTestOne)
        self.view.addSubview(viewTestTwo)
    }
    
    private func initViewTwo() {
        
        viewTestTwo.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    private func initViewOne() {
       
        viewTestOne.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        viewVStack.translatesAutoresizingMaskIntoConstraints = false
        
        viewVStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        viewVStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        
        viewVStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        viewVStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        initViewOne()
        initViewTwo()
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
