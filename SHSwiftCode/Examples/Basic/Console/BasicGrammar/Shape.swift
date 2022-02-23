//
//  Shape.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 25/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class Shape {
    
    var numberOfSides = 0

    var name: String
    var age: Int
    var money: Float?
    
    /*
     构造函数
     如果所有变量之中没有不确定性的变量(结尾有?)
     那么必须全部出现在构造函数里
     这样做的目的是防止空值
    */
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    /*
     析构函数
    */
    deinit {
        print("deinit")
    }
    
    func simpleDescription() -> String {
        
        return "A shape with \(numberOfSides) sides."
    }
    
    
    
}
