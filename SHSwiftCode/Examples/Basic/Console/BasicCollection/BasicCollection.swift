//
//  BasicCollection.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 22/06/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

/**
 如果创建一个 Arrays、Sets 或 Dictionaries
 并且把它分配成一个变量，这个集合将会是可变的。这意味着你可以在创建之后添加更多或移除已存在的数据项，或者改变集合中的数据项。如果我
 把 Arrays、Sets 或 Dictionaries 分配成常量，那么它就是不可变的，它的大小和内容都不能被改变。
 */
class BasicCollection {
    
    /*
     数组
    */
    func arrayTest() {
        
        // 声明数组
        var stringArray: Array<String>
        
        // 创建数组
        stringArray = Array<String>()
        
        // 添加数组元素
        stringArray.append("1")
        stringArray.append("2")
        stringArray.append("3")
        
        
        // 简化的声明数组方法
        var nameArray: [String]
        var ageArray: [Int]
        
        // 创建数组
        ageArray = [Int]()
        
        nameArray = [String](arrayLiteral: "1", "2", "3")
        // 插入数组元素
        nameArray.insert("4", at: 1)
        
        ageArray = [1, 2, 3]
        
        // 打印数组元素
        print(stringArray[1])
        
        // 遍历数组
        for name in nameArray {
            print(name)
        }
        
        // 遍历数组
        for (index, value) in nameArray.enumerated() {
            print("intex \(index) is \(value)")
        }
        
        for index in 0..<ageArray.count {
            print(ageArray[index])
        }
        
        // 删除元素
        nameArray.remove(at: 1)
        print(nameArray[1])
    }
    
    /*
     集合
    */
    func setsTest() {
        
        // 声明集合
//        var stringSet: Set<String>
        
        // 创建集合
//        stringSet = Set<String>()
        
        var nameSet: Set<String> = ["s", "e", "t", "s", "s"]
        
        // 遍历集合
        for name in nameSet {
            print(name)
        }
        
        print("after insert a")
        nameSet.insert("a")
        for name in nameSet {
            print(name)
        }
        
        print("after remove 'e'")
        nameSet.remove("e")
        for name in nameSet {
            print(name)
        }
        
        print("-------------------")
        let setOne: Set<String> = ["a", "b", "c", "d"]
        let setTwo: Set<String> = ["a", "b"]
        let setThree: Set<String> = ["c", "d"]
        
        // 交集
        print(setOne.intersection(setTwo))
        
        // 并集
        print(setTwo.union(setThree))
        
        // 差集
        print(setOne.subtracting(setTwo))
        
     }
    
    /*
     字典
    */
    func dictionariesTest() {
        
        // 声明字典
        var stringDict: Dictionary<String, String>
    
        // 简化声明字典的语法
//        var drinkDict: [String: String]
        
        // 创建字典
//        var nameDict = Dictionary<String, String>()
        
        stringDict = Dictionary<String, String>()
        stringDict["1"] = "a"
        stringDict["2"] = "b"
        stringDict["3"] = "c"
    
        // 打印元素
        print(stringDict["2"]!)
        
        // 遍历字典
        for (key, value) in stringDict {
            print("\(key) is \(value)")
        }
    
        let stringDictKeys = stringDict.keys
        print(stringDictKeys)
        
        let stringDictValues = stringDict.values
        print(stringDictValues)
        
        
    }
    
}
