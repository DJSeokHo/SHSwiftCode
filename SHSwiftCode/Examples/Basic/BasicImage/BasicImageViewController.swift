//
//  BasicImageViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/24.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicImageViewController: UIViewController {

    private static let TAG: String = "BasicImageViewController"
    
    private var fullScreenSize: CGSize?
    
    @IBOutlet var imageViewFirst: UIImageView!
    @IBOutlet var imageViewSecond: UIImageView!
    @IBOutlet var imageViewThird: UIImageView!
    
    @IBOutlet var imageViewAuto: UIImageView!
    @IBOutlet var buttonStart: UIButton!
    @IBOutlet var buttonStop: UIButton!
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullScreenSize = DisplayUtility.getFullScreenSize()
        setListener()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initView()
        initAutoView()
    }
    
    private func initView() {
        imageViewFirst.image = UIImage(named: "test_image_1.png")
        imageViewSecond.image = UIImage(named: "test_image_2.png")
        imageViewThird.image = UIImage(named: "test_image_3.png")
    }
    
    private func initAutoView() {
       
        var imageArray: [UIImage]
        imageArray = Array<UIImage>()
        
        imageArray.append(UIImage(named: "test_image_1.png")!)
        imageArray.append(UIImage(named: "test_image_2.png")!)
        imageArray.append(UIImage(named: "test_image_3.png")!)
        
        imageViewAuto.animationImages = imageArray
        
        imageViewAuto.animationDuration = 3
        
        /* 0 是无限循环 */
        imageViewAuto.animationRepeatCount = 0
        
    }
    
    private func setListener() {
        
        buttonStart.addTarget(self, action: #selector(self.onButtonStartClick), for: UIControl.Event.touchUpInside)
        
        buttonStop.addTarget(self, action: #selector(self.onButtonStopClick), for: UIControl.Event.touchUpInside)
    }

    @objc private func onButtonStartClick() {
        imageViewAuto.startAnimating()
    }
    
    @objc private func onButtonStopClick() {
        imageViewAuto.stopAnimating()
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
