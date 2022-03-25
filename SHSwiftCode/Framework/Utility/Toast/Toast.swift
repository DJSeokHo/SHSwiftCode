//
//  ToastManager.swift
//  USHome
//
//  Created by Seok Ho on 2020/12/30.
//

import Foundation
import UIKit

/**
 need to call initToast() before use
 
 Toast.instance.initToast()
 window!.addSubview(Toast.instance.toastView)
 
 */
class Toast {
    
    public static let instance = Toast()
    
    private init() {}
    
    public var toastView: ToastView!
    
    public func initToast() {
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        let width = screenWidth - 50
        
        toastView = ToastView(frame: CGRect(x: 25, y: screenHeight - 160, width: width, height: 50))
        toastView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        toastView.isHidden = true
    }
    
    public func showShortTimeToast(content: String) {
        
        if toastView.isHidden == false {
            return
        }
        
        toastView.setContent(content: content)
        
        self.toastView.isHidden = false
        
        ThreadUtility.startThread {
            ThreadUtility.startUIThread(runnable: {
                self.toastView.isHidden = true
            }, afterSeconds: 2.5)
        }
    }
    
    public func showLongTimeToast(content: String) {
        
        if toastView.isHidden == false {
            return
        }
        
        toastView.setContent(content: content)
        
        self.toastView.isHidden = false
        
        ThreadUtility.startThread {
            ThreadUtility.startUIThread(runnable: {
                self.toastView.isHidden = true
            }, afterSeconds: 4)
        }
    }
}
