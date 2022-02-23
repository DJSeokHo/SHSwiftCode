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
    
    @IBOutlet var buttonRates: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for buttonRate in buttonRates {
            buttonRate.alpha = 0
        }
        
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: model.image)
        button.setTitle("", for: .normal)
        
        initListener()
        
        imageView.setBlurEffect(style: .dark)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fadeInAnimation()

    }
    
    func slideInAnimation() {
        
    }
    
    func fadeInAnimation() {
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            self.buttonRates[0].alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
            self.buttonRates[1].alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
            self.buttonRates[2].alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
            self.buttonRates[3].alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
            self.buttonRates[4].alpha = 1.0
        }, completion: nil)
        
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
