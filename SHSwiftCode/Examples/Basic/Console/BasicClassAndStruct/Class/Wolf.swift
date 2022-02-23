//
//  Wolf.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 28/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class Wolf {
    var name: String
    var age: Int
    
    /*
     构造器
    */
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    /*
     析构器
    */
    deinit {
        print("deinit")
    }
    
    func info() {
        print("my name is \(self.name), age is \(self.age)")
    }
}
