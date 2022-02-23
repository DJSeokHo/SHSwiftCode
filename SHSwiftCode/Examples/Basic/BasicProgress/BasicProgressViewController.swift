//
//  BasicProgressViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/30.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicProgressViewController: UIViewController {

    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }

    private var progressView:UIProgressView!
    private var activityIndicator:UIActivityIndicatorView!
    private var timer:Timer?
    private var button:UIButton!
    
    private var count = 0
    private let complete = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createProgressView()
        createActivityIndicatorView()
        createButton()
    }
    
    private func createProgressView() {
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        progressView = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        progressView.progressTintColor = UIColor.blue
        
        progressView.trackTintColor = UIColor.orange
        
        progressView.frame = CGRect(x: 0,y: 0,width: fullScreenSize.width * 0.8,height: 50)
        progressView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.2)
        self.view.addSubview(progressView)
    }

    private func createActivityIndicatorView() {
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        
        activityIndicator.color = UIColor.white
        
        activityIndicator.backgroundColor = UIColor.darkGray
        
        activityIndicator.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.4)
        self.view.addSubview(activityIndicator);
    }
    
    private func createButton() {
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        button.setTitle("Reset", for: UIControl.State.normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(onButtonClick), for: UIControl.Event.touchUpInside)
        button.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.65)
        self.view.addSubview(button)

        // 先執行一次進度條的動作
        self.onButtonClick()
        
    }
    
    @objc private func onButtonClick() {
        // 读取进度条时冻结按钮
        button.isEnabled = false
        button.backgroundColor = UIColor.red
       
        progressView.progress = 0
        activityIndicator.startAnimating()

        // 建立一個 NSTimer
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(showProgress), userInfo: ["test":"for userInfo test"], repeats: true)
      
    }

    /*
     定时器按照一定时间间隔执行的方法
     */
    @objc private func showProgress(sender: Timer) {
       
        count += 1

        // 添加进度
        progressView.progress = Float(count) / Float(complete)

        // 进度完成时
        if count >= complete {
            // 示範 userInfo 傳入的參數
            let info = sender.userInfo as? Dictionary<String, AnyObject>
            print(info?["test"] ?? "")

            // 重設計數器及 NSTimer 供下次按下按鈕測試
            count = 0
            timer?.invalidate()
            timer = nil

            // 隐藏环形进度标示
            activityIndicator.stopAnimating()

            // 解除被冻结的按钮
            button.isEnabled = true
            button.backgroundColor = UIColor.blue
        }
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
