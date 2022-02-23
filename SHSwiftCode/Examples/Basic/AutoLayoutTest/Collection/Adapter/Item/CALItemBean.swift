//
//  CALItemBean.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/03/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation
import UIKit

class CALItemBean {
    
    public static let VIEW_HEIGHT: CGFloat = 78
    public static let LABEL_VIEW_HEIGHT: CGFloat = 20
    
    public var content = ""
    public var viewHeight: CGFloat = CALItemBean.VIEW_HEIGHT + CALItemBean.LABEL_VIEW_HEIGHT
    public var stackViewHeight: CGFloat = 0
    public var labelHeight: CGFloat = CALItemBean.LABEL_VIEW_HEIGHT
    
    public var list = [UIView]()
    
    public var isSmall = true
}
