//
//  BasicCheckAPICanUsable.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 23/06/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class BasicCheckAPICanUsable {
    
    /*
        if #available(平台名称 版本号, ..., *) {
        APIs 可用，语句将执行
        } else {
        APIs 不可用，语句将不执行
        }
    */
    func check() {
        
        if #available(iOS 10, macOS 10.12, *) {
            // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
        }
        else {
            // 使用先前版本的 iOS 和 macOS 的 API
        }
        
    }
}
