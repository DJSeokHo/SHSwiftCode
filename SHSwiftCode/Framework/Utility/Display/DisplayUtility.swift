//
//  DisplayUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2019/10/21.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation
import UIKit

class DisplayUtility {
    
    public static func getFullScreenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    public static func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
              statusBarHeight = window.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

            }
        }
        else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
}
