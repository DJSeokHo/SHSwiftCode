//
//  UIScrollViewExtension.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/03/31.
//

import Foundation
import UIKit

extension UIScrollView {
    
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
    
}
