//
//  StackInScrollViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/03/23.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class StackInScrollViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var button: UIButton!
    @IBOutlet var scrollContentView: UIView!
    
    var lc: NSLayoutConstraint!
    
    var list = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        
        scrollContentView.backgroundColor = UIColor.lightGray
    }
    @IBAction func onButtonChange(_ sender: Any) {
        
        lc.constant = 300
        
        view.layoutIfNeeded()
        
        scrollView.contentSize = CGSize(width: scrollContentView.frame.width, height: scrollContentView.frame.height)
        ILog.debug(tag: #file, content: "\(stackView.frame.height) \(scrollContentView.frame.height)")
        
    }
    @objc private func onButtonClick() {
        
        list.removeAll()
        
        for i in 0..<15 {
         
            let s = UIView()
           
            s.translatesAutoresizingMaskIntoConstraints = false
            
            s.backgroundColor = i % 2 == 0 ? UIColor.red : UIColor.blue
            
            if i == 2 {
                
                lc = s.heightAnchor.constraint(equalToConstant: 100)
                lc.isActive = true
            }
            else {
                s.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
            }
          
            s.widthAnchor.constraint(equalToConstant: DisplayUtility.getFullScreenSize().width).isActive = true
            stackView.addArrangedSubview(s)
            list.append(s)
        }
        
        view.layoutIfNeeded()
        
        scrollView.contentSize = CGSize(width: scrollContentView.frame.width, height: scrollContentView.frame.height)
        ILog.debug(tag: #file, content: "\(stackView.frame.height) \(scrollContentView.frame.height)")

//        let s1 = UIView()
//
//        s1.translatesAutoresizingMaskIntoConstraints = false
//        s1.backgroundColor = UIColor.blue
//        s1.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        s1.widthAnchor.constraint(equalToConstant: DisplayUtil.getFullScreenSize().width).isActive = true
//
//
//
//
//        stackView.addArrangedSubview(s1)
        
//        scrollContentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
////        s.frame.origin = CGPoint(x: 0, y: 0)
//        s.topAnchor.constraint(equalTo: scrollContentView.topAnchor, constant: 0).isActive = true
//        s.leftAnchor.constraint(equalTo: scrollContentView.leftAnchor, constant: 0).isActive = true
//        s.rightAnchor.constraint(equalTo: scrollContentView.rightAnchor, constant: 0).isActive = true
//        scrollContentView.addSubview(s)
//        
//        s1.topAnchor.constraint(equalTo: s.bottomAnchor, constant: 0).isActive = true
//        s1.leftAnchor.constraint(equalTo: scrollContentView.leftAnchor, constant: 0).isActive = true
//        s1.rightAnchor.constraint(equalTo: scrollContentView.rightAnchor, constant: 0).isActive = true
//        
////        s1.frame.origin = CGPoint(x: 0, y: 100)
//        scrollContentView.addSubview(s1)
//        
//        scrollContentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        scrollStackView.frame.size = CGSize(width: scrollStackView.frame.width, height: 200)
//        ILog.debug(tag: #file, content: "add s1 \(scrollStackView.frame.height)")
//
//        ILog.debug(tag: #file, content: "??? \(scrollStackView.frame.height) \(scrollView.frame.height) \(scrollView.contentSize.height)")
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
