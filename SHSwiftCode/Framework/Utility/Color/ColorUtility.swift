//
//  ColorUtil.swift
//  ColorUtility
//
//  Created by Seok Ho on 2020/04/30.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation
import UIKit

class ColorUtility {
    
    public static func colorWithRGB(r: CGFloat, g: CGFloat, b: CGFloat, alpha:CGFloat) -> UIColor
    {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    public static func colorWithHexString(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var string:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (string.hasPrefix("#")) {
            string = (string as NSString).substring(from: 1)
        }
        
        if (string.count != 6) {
            return UIColor.clear
        }
        
        let rString = (string as NSString).substring(to: 2)
        let gString = ((string as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((string as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:UInt64 = 0, g:UInt64 = 0, b:UInt64 = 0;
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
}
