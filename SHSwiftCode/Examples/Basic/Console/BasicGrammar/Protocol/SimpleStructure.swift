//
//  SimpleStructure.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 25/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

struct SimpleStructure: ExampleProtocol {
    
    var simpleDescription: String
    
    /*
     mutating 关键字用来标记一个会修改结构体的方法
     */
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    
}
