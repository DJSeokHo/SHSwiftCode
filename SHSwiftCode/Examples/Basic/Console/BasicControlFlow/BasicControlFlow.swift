//
//  BasicControlFlow.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 23/06/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class BasicControlFlow {
    
    func forItemInItemsMethod() {
        
        // array
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
        
        // dictionary
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        let base = 3
        let max = 10
        var answer = 1
        
        for _ in 1...max {
            answer *= base
        }
        
        let step = 5
        for time in stride(from: 0, to: 60, by: step) {
            print(time)
        }
    }
    
    func whileMethod() {
        
        var index = 1
        
        while index < 5 {
            
            print(index)
            index += 1
            
        }
    }
    
    /*
     same as do while
    */
    func repeatWhileMethod() {
        
        var index = 1
        
        repeat {
            
            print(index)
            index += 1
            
        } while index < 5
        
    }
    
    func switchMethod() {
        let integerToDescribe = 5
        let description = "The number \(integerToDescribe) is"
        
//        switch integerToDescribe {
//            
//            case 2, 3, 5, 7, 11, 13, 17, 19:
//                description += " a prime number, and also"
//                break
//            
//            default:
//                description += " an integer."
//                break
//        }
        
        print(description)
    }
    
    func switchMethodWithFallthroughMethod() {
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        
        switch integerToDescribe {
            
            case 2, 3, 5, 7, 11, 13, 17, 19:
                description += " a prime number, and also"
                fallthrough
            
            default:
                description += " an integer."
                break
            
        }
        
        print(description)
    }
    
    
    
}
