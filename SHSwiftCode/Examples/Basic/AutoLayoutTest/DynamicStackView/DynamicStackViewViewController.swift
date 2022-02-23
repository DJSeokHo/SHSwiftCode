//
//  DynamicStackViewViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/03/19.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class DynamicStackViewViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    private var viewList = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewList.removeAll()
        
    }

    @IBAction func onButtonClick(_ sender: Any) {
        createView()
    }
    
    private func createView() {
           
        let view = UIView()
        view.frame.size = CGSize(width: DisplayUtility.getFullScreenSize().width, height: 40)
//           if isAdd {
//               view.backgroundColor = UIColor.blue
//           }
//           else {
//               view.backgroundColor = UIColor.black
//           }
        
        if viewList.count % 2 == 0 {
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.blue
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
       
        stackView.addArrangedSubview(view)
        viewList.append(view)
        
        stackView.frame.size = CGSize(width: stackView.frame.width, height: CGFloat(40 * viewList.count))
        
        ILog.debug(tag: #file, content: viewList.count)
       
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
