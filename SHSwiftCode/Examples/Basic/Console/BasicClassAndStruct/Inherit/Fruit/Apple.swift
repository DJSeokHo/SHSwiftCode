//
//  Apple.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 29/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class Apple: Fruit {
    
    public var name: String!
    
    public func taste() {
        print("\(name!) taste good!")
    }
    
    /*
     重写了父类的方法
    */
    override func info() {
        super.info()
        print("a apple, weight is \(weight)")
    }
}
