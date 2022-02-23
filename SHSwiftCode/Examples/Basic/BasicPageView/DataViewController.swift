//
//  DataViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/05/01.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    private let tag = "DataViewController"

    @IBOutlet var label: UILabel!
    
    public var text: String!
    
    public var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ILog.debug(tag: tag, content: "\(text!) viewDidLoad")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ILog.debug(tag: tag, content: "\(text!) viewWillAppear")
        label.text = text
    }

    deinit {
        ILog.debug(tag: tag, content: "\(text!) deinit")
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
