//
//  Rect.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 29/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

struct Rect {
    var x: Int
    var y: Int
    var width: Int
    var height: Int
    
    /*
     结构体和枚举都是值类型，值类型一般实例方法不能改变实例存储的属性
     如果想让实例方法改变实例属性，需要在方法前加上 mutating 关键字即可
    */
    mutating func moveBy(x: Int, y: Int) {
        self.x += x
        self.y += y
    }
}
