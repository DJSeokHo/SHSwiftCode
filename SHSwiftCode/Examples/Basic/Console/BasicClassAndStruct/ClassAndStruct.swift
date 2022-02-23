//
//  BasicClass.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 28/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class ClassAndStruct {
    
    func classTest() {
        
        print(Person.TAG)
        
        Person.info()
        
        // 弱引用
//        weak var weakPerson: Person?
//        weakPerson = Person()
//        ILog.debug(tag: #file, content: weakPerson?.name ?? "")
        
        let person: Person = Person()
        
        person.name = "who"
        person.age = 30
        person.say(content: "haha")
        print("\(person.name) \(person.age)")
        
        /* 该变量含有属性观察者 */
        person.fullName = "full-name"
        
        let wolf: Wolf = Wolf(name: "wolf", age: 8)
        wolf.info()
        
        // 链式调用
        person.setName(name: "person").setAge(age: 32).say(content: "hehe")
        print("\(person.name) \(person.age)")
        
        let user = User(first: "user", last: "who")
        print(user.fullName)
        
        user.fullName = "haha-hehe"
        print("\(user.first) \(user.last)")
        
        person.setName(name: "name??", andAge: 10).say(content: "?????")
       
    }
    
    func structTest() {
        var dog = Dog()
        dog.name = "dog"
        dog.age = 9
        dog.run()
        dog.jump()
        
        var rect = Rect(x: 10, y: 10, width: 100, height: 100)
        rect.moveBy(x: 100, y: 100)
    }
    
    func selectableTest() {
        
        let customer = Customer(name: "who")
        
        let employee = Employee(name: "gucci", title: "cute")
        customer.employee = employee
        
        employee.company = Company(name: "SWein", address: "Seoul")
        print("for \(customer.name) is \(customer.employee!.company.name)")
        
    }
    
    func inheritTest() {
        let a = Apple()
        a.weight = 50
        a.name = "apple"
        a.info()
        a.taste()
        
        let flyCar = FlyCar()
        flyCar.speed = 50;
        print("fly car speed is \(flyCar.speed)")
        
        print(Car.type)
        
        // 子类重写了父类由class修饰的静态属性
        print(FlyCar.type)
        
        // 子类改变了父类的只读属性，所以这里可以赋值，但是没有意义
        FlyCar.type = "fly car"
    }
    
    /*
     判断对象类型
    */
    func checkObjectType() {
        
//        let car = FlyCar()
//        print("\(car is FlyCar)")
//        print("\(car is Car)")
//        print("\(car is Fruit)")
        
    }
    
    /*
     强制向下转换对象类型
    */
    func castingObjectType() {
//        let car: Car = Car()
//        let flyCar: FlyCar = car as! FlyCar
    }
    
    /*
     Any和AnyObject
     AnyObject: 代表任何类的实例 类似Java的object
     Any: 代表任何类型 类似Java的Object
    */
    func any() {
        
//        var anyArray: [Any] = [1, "1", Apple()]
//        
//        var anyObjectArray: [AnyObject] = [Car(), FlyCar(), Apple()]
    }
    
    func extensionTest() {
       
    }
    
    func protocolTest() {
        print("protocolTest")
        
        print(AppleEatable.TAG)
        let appleEatable: AppleEatable!
        appleEatable = AppleEatable()
        appleEatable.taste()
        appleEatable.test("haha", "hehe")
        
        AppleEatable.info("sh")
        
        let protocolTestDemo = ProtocolTestDemo()
        protocolTestDemo.test()
    }
}

