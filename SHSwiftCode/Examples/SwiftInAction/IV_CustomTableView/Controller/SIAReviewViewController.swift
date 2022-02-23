//
//  SIAReviewViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/22.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit
import MapKit

class SIAReviewViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    public var model = RestaurantModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: model.image)
        button.setTitle("", for: .normal)
        
        initListener()
        
        imageView.setBlurEffect(style: .dark)
    }
    
    func initListener() {
        button.setOnClickListener(self, action: #selector(close))
    }
    
    @objc func close() {
        finish()
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
