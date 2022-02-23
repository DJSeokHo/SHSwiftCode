//
//  Person.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 28/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class Person {
    
    public static let TAG: String = "Person"
    
    
    var name: String = ""
    var age: Int = 0
    
    /*
     构造器
     */
    init() {
        
    }
    
    /*
     析构器
     */
    deinit {
        print("deinit")
    }
    
    /* 带属性观察者的属性 */
    var fullName: String = "" {
        
        /* 赋值之前会触发这个方法 */
        willSet(newValue) {
            print("before set fullName to \(newValue)")
            self.fullName = newValue
        }
        
        /* 赋值之后会触发这个方法 */
        didSet {
            print("after set fullName is \(self.fullName)")
        }
        
    }
    
    func say(content: String) {
        print(content)
    } 
    
    func setName(name: String) -> Person {
        self.name = name
        return self
    }
    
    func setAge(age: Int) -> Person {
        self.age = age
        return self
    }
    
    /*
     这里的andAge是显示的指定外部形参名
     方法名的最后一个单词已经描述了第一个参数的意义，所以第一个参数无需指定外部形参名，
     从第二个形参开始，可以有外部形参名
    */
    func setName(name: String, andAge age: Int) -> Person {
        self.name = name
        self.age = age
        return self
    }
    
    /*
     类，结构体，枚举中都可以使用static来表示静态方法(类方法)
     在类中才能使用class来表示类方法
     
     static 和 class 的区别在于，用class修饰的方法可以被子类重写，而static 不行
     
     一般 类方法，推荐使用 static，因为就解耦的重要性来说，不推荐使用继承
    */
    static func info() {
        print("this is Person class")
    }
}
