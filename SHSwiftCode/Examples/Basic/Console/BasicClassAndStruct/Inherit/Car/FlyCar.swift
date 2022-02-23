//
//  FlyCar.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 29/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class FlyCar: Car {
    
    // 重写speed属性
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = newValue * newValue
        }
    }
    
    //重写计算属性，增加了set部分，变成了读写
    override static var type: String {
        get {
            return "Fly Car"
        }
        set {
            print("new \(newValue)")
        }
    }
    
}
