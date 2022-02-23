//
//  BasicSliderViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/31.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicSliderViewController: UIViewController {

    @IBAction func onButtonCloseClick(_ sender: UIButton) {
       finish()
    }
    
    private var imageView: UIImageView!
    private var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "test_image_1.png")
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        
        imageView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        
        self.view.addSubview(imageView)
        
        
        slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: fullScreenSize.width * 0.9, height: 50)
        
        slider.backgroundColor = UIColor.lightGray
        
        slider.maximumTrackTintColor = UIColor.orange
        slider.minimumTrackTintColor = UIColor.purple
        
        slider.thumbTintColor = UIColor.brown
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.value = 100
        
        slider.isContinuous = true
        
        slider.addTarget(self, action: #selector(onSliderChange), for: UIControl.Event.valueChanged)
        
        slider.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.65)
        
        self.view.addSubview(slider)
    }

    @objc private func onSliderChange() {
        
        imageView.alpha = CGFloat(slider.value / slider.maximumValue)
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
