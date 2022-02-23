//
//  IntExtension.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 25/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

/*
 使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。
 你可以使用扩展让某个在别处声明的类型来遵守某个协议，这同样适用于从外部库或者框架引入的类型。
 */
extension Int: ExampleProtocol {
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
    
}
