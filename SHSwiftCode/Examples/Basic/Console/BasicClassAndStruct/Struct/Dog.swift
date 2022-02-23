//
//  Dog.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 28/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

struct Dog {
    var name: String!
    var age: Int!
    
    func run() {
        print("\(name!) running")
        self.jump()
    }
    
    func jump() {
        print("\(name!) jump")
    }
}
