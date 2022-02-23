//
//  BasicPageViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/24.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicPageViewController: UIViewController, UIScrollViewDelegate {
    
    private static let TAG = "BasicPageViewController"
    
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    private var fullScreenSize: CGSize!
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initScrollView()
        initPageControl()
    }
    
    private func initScrollView() {
        
        fullScreenSize = DisplayUtility.getFullScreenSize()
        
        scrollView = UIScrollView()
        
        scrollView.frame = CGRect(x: 0, y: 50, width: fullScreenSize.width, height: fullScreenSize.height - 50)

        // 设置视图范围
        scrollView.contentSize = CGSize(width: fullScreenSize.width * 5, height: fullScreenSize.height - 50)

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false

        scrollView.bounces = true

        scrollView.isPagingEnabled = true
        
        scrollView.delegate = self

        self.view.addSubview(scrollView)
    }

    /*
     页面指示器
     */
    private func initPageControl() {
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width * 0.85, height: 50))
        
        pageControl.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.85)
        
        pageControl.numberOfPages = 5
        
        pageControl.currentPage = 0
        
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        // 给指示点点设置点击监听
        pageControl.addTarget(self, action: #selector(pageChanged), for: UIControl.Event.valueChanged)
        
        // 加入到基底的view中 (不是加到 UIScrollView 里)
        // 因为是后面加入的 所以會盖在 UIScrollView 上面
        self.view.addSubview(pageControl)
        
        var label: UILabel!
        
        for i in 0...4 {
            label = UILabel(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
            label.center = CGPoint(x: fullScreenSize.width * (0.5 + CGFloat(i)), y: fullScreenSize.height * 0.2)
            
            label.font = UIFont(name: "Helvetica-Light", size: 48.0)
            label.textAlignment = NSTextAlignment.center
            label.text = "\(i + 1)"
            
            scrollView.addSubview(label)
        }
    }
    
    // 滑动结束时
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        ILog.debug(tag: BasicPageViewController.TAG, content: "scrollViewDidEndDecelerating page \(page)")
        
        pageControl.currentPage = page
    }
    
    @objc func pageChanged(sender: UIPageControl) {
        
        ILog.debug(tag: BasicPageViewController.TAG, content: "sender.currentPage \(sender.currentPage)")
        
        var frame = scrollView.frame
        
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        
        scrollView.scrollRectToVisible(frame, animated: true)
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
