//
//  ToastView.swift
//  USHome
//
//  Created by Seok Ho on 2020/12/30.
//

import UIKit

class ToastView: UIWindow {
    
    private let TAG = "ToastView"

    @IBOutlet var label: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    deinit {
       
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialization()
    }
    
    private func initialization() {
        onCreateView()
    }
    
    private func onCreateView() {

        let view = Bundle(for: type(of: self)).loadNibNamed(TAG, owner: self, options: nil)?.first as! UIView
        view.frame = bounds

        addSubview(view)
        
//        view.layer.masksToBounds = false
//        view.layer.cornerRadius = 25
    }
    
    public func setContent(content: String) {
        label.text = content
    }
}
