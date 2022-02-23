//
//  FunctionTypeParameter.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 03/10/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

/*
 在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它
 */
class FunctionTypeParameter {
    
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    
    /*
     你可以用 (Int, Int) -> Int 这样的函数类型作为另一个函数的参数类型。这样你可以将函数的一部分实现留给函数的调用者来提供。
     */
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b:Int) {
        print("Result is \(mathFunction(a, b))")
    }
    
    
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
    }
    
    func test() {
        
        
        // 定义一个叫做 mathFunction 的变量，类型是‘一个有两个 Int 型的参数并返回一个 Int 型的值的函数’，并让这个新变量指向 addTwoInts 函数
        var mathFunction: (Int, Int) -> Int
        
        mathFunction = addTwoInts(_:_:)
        print("Result: \(mathFunction(2, 3))")

        mathFunction = multiplyTwoInts(_:_:)
        print("Result: \(mathFunction(2, 3))")
        // Prints "Result: 6"
        
        // 函数类型作为参数类型
        printMathResult(addTwoInts, 3, 5)
        
    }
    
}
