//
//  Closure.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 06/10/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class Closure {
    
    /*
     
     闭包表达式语法有如下的一般形式

     { (parameters) -> return type in
         statements
     }
     
     */
    
    public static let TAG = "Closure"
    
    /*
     该函数会返回一个闭包
     */
    public func getMathFunc(_ type: String) -> ((Int) -> Int) {
        
        switch type {
        case "square":
            /*
             闭包
             定义闭包无需 func 关键字
             定义闭包需要在参数和返回类型之后添加一个 in
             定义闭包的第一个花括号必须要移到形参列表的圆括号之前
             
             {(形参列表) -> 返回值类型 in
                可执行语句
             }
             */
            return {(val: Int) -> Int in
                return val * val
            }
            
        case "cube":
            
            return {(val: Int) -> Int in
                return val * val * val
            }
            
        default:
            
            return {(val: Int) -> Int in
                var result = 1
                for index in 2...val {
                    result *= index
                }
                return result
            }
        }
    }
    
    /*
     定义一个闭包常量
     闭包常量是引用类型，不是值类型
     */
    public var square = {(value: Int) -> Int in
        return value * value
    }
    
    /*
     定义闭包，并立即使用该闭包
     */
    public var cube = {(value: Int) -> Int in
        return value * value * value
    }(4)
}
