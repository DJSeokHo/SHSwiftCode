//
//  ExampleProtocol.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 25/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

/*
 类、枚举和结构体都可以遵循协议
 注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。
 SimpleClass 的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）。
 */
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
