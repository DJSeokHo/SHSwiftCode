//
//  Car.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 29/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class Car {
    
    var speed: Double = 0
    
    // class 的类属性可以被子类重写
    // 这里的type是计算属性，只有get部分，目前为只读
    class var type: String {
        return "Car"
    }
}
