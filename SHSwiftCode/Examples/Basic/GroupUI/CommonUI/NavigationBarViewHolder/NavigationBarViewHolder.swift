//
//  NavigationBarViewHolder.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 12/08/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationBarViewHolderDelegate {
    func onButtonLeftClicked()
    func onButtonRightClicked()
}

class NavigationBarViewHolder: UIView {
    
    
    private static let TAG = "NavigationBarViewHolder"
    
    @IBOutlet var buttonLeft: UIButton!
    @IBOutlet var buttonRight: UIButton!
    
    @IBOutlet var labelTitle: UILabel!
    
    private var navigationBarViewHolderDelegate: NavigationBarViewHolderDelegate?
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        ILog.debug(tag: NavigationBarViewHolder.TAG, content: "override init \(frame.width) \(frame.height)")
        initialization()
    }
    deinit {
        ILog.debug(tag: NavigationBarViewHolder.TAG, content: "deinit")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ILog.debug(tag: NavigationBarViewHolder.TAG, content: "required init")
        initialization()
    }
    
    
    private func initialization() {
        onCreateView()
        setListener()
    }
    
    private func onCreateView() {
        ILog.debug(tag: NavigationBarViewHolder.TAG, content: "initialization")
        let view = Bundle(for: type(of: self)).loadNibNamed(NavigationBarViewHolder.TAG, owner: self, options: nil)?.first as! UIView
        view.frame = bounds
    
        addSubview(view)
        setListener()
    }
    
    public func setDelegate(navigationBarViewHolderDelegate: NavigationBarViewHolderDelegate) {
        self.navigationBarViewHolderDelegate = navigationBarViewHolderDelegate
    }
    
    public func setTitle(title: String) {
        labelTitle.text = title
        labelTitle.isHidden = false
    }
    
    public func hideTitle() {
        labelTitle.isHidden = true
    }
    
    public func showRightButton() {
        self.buttonRight.isHidden = false
    }
    
    public func hideRightButton() {
        self.buttonRight.isHidden = true
    }
    
    public func showLeftButton() {
        self.buttonLeft.isHidden = false
    }
    
    public func hideLeftButton() {
        self.buttonLeft.isHidden = true
    }
    
    public func setLeftButtonImage(imageName: String) {
        self.buttonLeft.setImage(UIImage(named: imageName), for: UIControl.State.normal)
    }
    
    public func setRightButtonImage(imageName: String) {
        self.buttonRight.setImage(UIImage(named: imageName), for: UIControl.State.normal)
    }
    
    private func setListener() {
       
        self.buttonLeft.addTarget(self, action: #selector(self.onButtonLeftCLicked(_:)), for: UIControl.Event.touchUpInside)
        
        self.buttonRight.addTarget(self, action: #selector(self.onButtonRightClicked(_:)), for: UIControl.Event.touchUpInside)
    }

    @objc private func onButtonLeftCLicked(_ sender: UIButton) {
        self.navigationBarViewHolderDelegate?.onButtonLeftClicked()
    }
    
    @objc private func onButtonRightClicked(_ sender: UIButton) {
        self.navigationBarViewHolderDelegate?.onButtonRightClicked()
    }
    
}
