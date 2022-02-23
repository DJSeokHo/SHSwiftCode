//
//  BasicScrollBigViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/24.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicScrollBigViewController: UIViewController, UIScrollViewDelegate {
    
    private static let TAG = "BasicScrollBigViewController"

    private var scrollView: UIScrollView!
    private var fullScreenSize: CGSize!
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initScrollView()
        initScrollViewContent()
    }
    
    private func initScrollView() {
        
        // Do any additional setup after loading the view.
        fullScreenSize = DisplayUtility.getFullScreenSize()
        
        scrollView = UIScrollView()
        
        // 实际视图范围是 3 x 2 个屏幕大小
        scrollView.frame = CGRect(x: 0, y: 50, width: fullScreenSize.width, height: fullScreenSize.height - 50)
        
        scrollView.contentSize = CGSize(width: fullScreenSize.width * 3, height: fullScreenSize.height * 2)
        
        scrollView.isScrollEnabled = true
        
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = true

        // 滑动条样式
        scrollView.indicatorStyle = UIScrollView.IndicatorStyle.black
        
        // 是否可以按状态列回到最上方
        scrollView.scrollsToTop = false
        
        // 是否滑动时只支持单方向 垂直或水平
        scrollView.isDirectionalLockEnabled = false
        
        // 滑动超过范围时是否使用弹回效果
        scrollView.bounces = true
        
        // 缩放默认大小
        scrollView.zoomScale = 1.0
        
        // 缩放最小值
        scrollView.minimumZoomScale = 0.5
        
        // 缩放最大值
        scrollView.maximumZoomScale = 2.0
        
        // 缩放时超过范围是否回弹
        scrollView.bouncesZoom = true
        
        scrollView.delegate = self
        
        // 可见视图的初始值是 0，0
        scrollView.contentOffset = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        
        // 是否以一页为单位滑动
        scrollView.isPagingEnabled = false
        
        self.view.addSubview(scrollView)
        
    }

    private func initScrollViewContent() {
        
        var view: UIView!
        
        for i in 0...2 {
            
            for j in 0...1 {
                
                view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                view.tag = i * 10 + j + 1
                view.center = CGPoint(x: fullScreenSize.width * (0.5 + CGFloat(i)), y: fullScreenSize.height * (0.5 + CGFloat(j)))
                
                let color = ((CGFloat(i) + 1) * (CGFloat(j) + 1)) / 12.0
                
                view.backgroundColor = UIColor.init(red: color, green: color, blue: color, alpha: 1)
                scrollView.addSubview(view)
                
            }
        }
    }
    
    // 开始滑动时
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        ILog.debug(tag: BasicScrollBigViewController.TAG, content: "scrollViewWillBeginDragging")
    }
    
    // 滑动时
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        ILog.debug(tag: BasicScrollBigViewController.TAG, content: "scrollViewDidScroll")
    }
    
    // 结束滑动时
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        ILog.debug(tag: BasicScrollBigViewController.TAG, content: "scrollViewDidEndDragging")
    }

    // 缩放的元件
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // 这里用来示范缩放，是tag为1的view
        // 也就是左上角的那个 View
        return self.view.viewWithTag(1)
    }
    
    // 开始缩放时
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        ILog.debug(tag: BasicScrollBigViewController.TAG, content: "scrollViewWillBeginZooming")
    }
    
    // 缩放时
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        ILog.debug(tag: BasicScrollBigViewController.TAG, content: "scrollViewDidZoom")
    }
    
    // 结束缩放时
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        ILog.debug(tag: BasicScrollBigViewController.TAG, content: "scrollViewDidEndZooming")
        
        // 缩放时会将 contentSize设置为这个元件的尺寸
        // 所以contentSize过小就无法滑动
        // 所以缩放完之后需要重置下size
        
        scrollView.contentSize = CGSize(width: fullScreenSize.width * 3, height: fullScreenSize.height * 2)
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
