//
//  BasicFundation.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 12/10/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

/*
 NSInteger, NSUInteger, CGFloat 这三个不是包装类
 */
class BasicFoundation {
    
    public static let TAG: String = "BasicFoundation"
    
    
    /*
     包装类，把值类型包装成对象
     NSValue, NSNumber
     可以用来包装单个 short, int, long, float, char, 指针, 对象 id
     包装后就可以把这些值类型 添加到 NSArray, NSSet等集合，因为这些集合的元素只能是对象
     
     包装类，NSValue 是 NSNumber的父类
     
     NSString, NSMutableString
     Swift内置了一个String结构体， let声明时不可变，var声明时可变
     String可以调用NSString的全部API。
     */
    public func packageClass() {
        
        // 将Int类的值包装成 NSNumber对象
        let numInt: NSNumber = NSNumber(value: 20)
        print(numInt.intValue)
        
        // 将Double类型的值包装成NSNumber对象
        let numDouble: NSNumber = NSNumber(value: 3.5)
        print(numDouble.doubleValue)
        
    }
    
    /*
     NSString, NSMutableString
     Swift内置了一个String结构体， let声明时不可变，var声明时可变
     String可以调用NSString的全部API。
     */
    public func testNSString() {
       
        let hello: NSString = "hello"
        print(hello)
        
        let name: NSString = "Seok Ho"
        
        var str: NSString = "hello"
        
        str = str.appending(name as String) as NSString
        
        print(str.length)
        
        let start: NSString = str.substring(to: 3) as NSString
        print(start)
        
        let end: NSString = str.substring(from: 3) as NSString
        print(end)
        
        let between: NSString = str.substring(with: NSMakeRange(2, 4)) as NSString
        print(between)
        
        let range = str.range(of: "Seok")
        print("\(range.location) \(range.length)")
        
        print(str.uppercased)
        print(str.lowercased)
    }
    
    /*
     可变字符串
     */
    public func testNSMutableString() {
        
        let name = "seok ho"
        let str = NSMutableString(string: name)
        
        str.append(" haha")
        print(str)
        
        str.insert("you ", at: 0)
        print(str)
        
        str.deleteCharacters(in: NSMakeRange(0, 3))
        print(str)
        
        str.replaceCharacters(in: NSMakeRange(0, 1), with: "kk")
        print(str)
        
        var str1 = NSMutableString(string: name)
        str1 = str1.appending(" hehe") as! NSMutableString
        print(str1)
        
    }
    
    /*
     日期与时间
     */
    public func testNSDate() {
        
        let date1 = NSDate()
        print(date1)
        
        /* 一天之后 */
        let date2 = NSDate(timeIntervalSinceNow: 3600 * 24)
        print(date2)
        
        /* 三天之前 */
        let date3 = NSDate(timeIntervalSinceNow: -3 * 3600 * 24)
        print(date3)
        
        /* 1970的20年后 */
        let date4 = NSDate(timeIntervalSince1970: 3600 * 24 * 366 * 20)
        print(date4)
        
        /* 获取当前地区的日期描述 */
        let cn = NSLocale.current
        print(date1.description(with: cn))
        
        /* 日期比较 */
        let earlier = date1.earlierDate(date2 as Date)
        print(earlier)
        
        let later = date1.laterDate(date2 as Date)
        print(later)
        
        switch date1.compare(date3 as Date) {
            
            case .orderedAscending:
                print("date1 在 date3 之前")
            
            case .orderedSame:
                print("date1 和 date3 相同")
            
            case .orderedDescending:
                print("date1 在 date3 之后")
        
        }
        
        print("date1 和 date3 之间差 \(date1.timeIntervalSince(date3 as Date)) 秒")
        print("date2 和 现在差 \(date1.timeIntervalSinceNow) 秒")
    }
    
    /*
     日期格式器
     */
    public func testNSDateFormatter() {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateString = df.string(from: Date())
        print(dateString)
    }
    
    /*
     日历和日期组件
     */
    public func testNSCalendarAndNSDateComponents() {
        
        /* 获取日期的各部分 */
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        
        let date = Date()
        
        let unitFlag: NSCalendar.Unit = [
            NSCalendar.Unit.year,
            NSCalendar.Unit.month,
            NSCalendar.Unit.day,
            NSCalendar.Unit.hour,
            NSCalendar.Unit.minute,
            NSCalendar.Unit.second,
            NSCalendar.Unit.weekday
        ]
        
        let comp = calendar!.components(unitFlag, from: date)
        print(comp.year!)
        print(comp.month!)
        print(comp.day!)
        print(comp.hour!)
        print(comp.minute!)
        print(comp.second!)
        print(comp.weekday!)
        
        
        /* 生成日期 */
        let comp1 = NSDateComponents()
        comp1.year = 2013
        comp1.month = 3
        comp1.day = 5
        comp1.hour = 18
        comp1.minute = 30
        comp1.second = 30
        
        let date1 = calendar!.date(from: comp1 as DateComponents)
        print(date1!)
    }
    
    public func testNSArray() {
        
        var array: NSArray = ["1", "2", "3", "4"];
        
        print("\(array.object(at: 1))")
        print("\(array.firstObject!)")
        print("\(array.lastObject!)")
        
        let subArray = array.objects(at: NSIndexSet(indexesIn: NSMakeRange(1, 2)) as IndexSet)
        print(subArray)
        
        let pos = array.index(of: "2")
        print(pos)
        
        array = array.adding("5") as NSArray
        array = array.addingObjects(from: ["6", "7"]) as NSArray
        
//        array.write(toFile: <#T##String#>, atomically: <#T##Bool#>)
        for content in array {
            print(content)
        }
        
        print(array.count)
    }
    
    public func testNSMutableArray() {
        
        print("-----------------")
        
        let mutableArray: NSMutableArray = ["1", "2", "3", "4"]
        mutableArray.add("5")
        mutableArray.addObjects(from: ["6", "7"])
        mutableArray.insert("0", at: 0)
        
        for content in mutableArray {
            print(content)
        }
        
        mutableArray.remove("3")
        mutableArray.removeObject(at: 0)
        mutableArray.replaceObject(at: 0, with: 11)
        
        for content in mutableArray {
            print(content)
        }
        
        print(mutableArray.count)
    }
    
    /*
     NSOrderedSet
     有序集合
     这里没有弄例子
     需要时再弄
     */
    public func testNSSet() {
        
        var mainSet: NSSet = NSSet(objects: "1", "2", "3", "4")
        var subSet: NSSet = NSSet()
        
        mainSet = mainSet.addingObjects(from: ["5", "6", "4"]) as NSSet
        
        subSet = subSet.addingObjects(from: ["2", "3"]) as NSSet
        
        // 计算并集
        print("\(mainSet.intersects(subSet as! Set))")
        
        // 计算交集
        print("\(subSet.isSubset(of: mainSet as! Set))")
        
        print("\(mainSet.contains("5"))")
    }
    
    /*
     NSMutableOrderedSet
     可变有序集合
     这里没有弄例子
     需要时再弄
     */
    public func testNSMutableSet() {
        
        let mainSet: NSMutableSet = NSMutableSet()
        let subSet: NSMutableSet = NSMutableSet()
        
        mainSet.add("1")
        mainSet.add("2")
        mainSet.add("3")
        mainSet.add("4")
        
        mainSet.addObjects(from: ["2", "3"])
        
        mainSet.add("5")
        mainSet.remove("5")
        
        subSet.add("2")
        subSet.add("3")
        
        // 计算两个集合的并集，直接改变集合
        mainSet.union(subSet as! Set)
        
        // 计算两个集合的差集，直接改变集合
        mainSet.minus(subSet as! Set)
        
        // 计算两个集合的交集， 直接改变集合
        mainSet.intersect(subSet as! Set)
        
    }
    
    public func testNSDictionary() {
        
        print("-------------------")
        
        let dict: NSDictionary = NSDictionary(dictionary: [
            "1": "one",
            "2": "two",
            "3": "three",
            "4": "four"
        ])
      
        print(dict)
        print(dict.allKeys)
        print(dict.allValues)
        print(dict.count)
        
        dict.enumerateKeysAndObjects() {
            key,value,_ in
            print("key \(key) : value \(value)")
        }
    }
    
    public func testNSMutableDictionary() {
        
        print("-------------------")
        
        let dict: NSMutableDictionary = NSMutableDictionary()
        
        dict.setValue("1", forKey: "one")
        dict["two"] = "2"
        dict.setValue("3", forKey: "three")
        
        dict.enumerateKeysAndObjects() {
            key,value,_ in
            print("key \(key) : value \(value)")
        }
        
        dict.removeObject(forKey: "two")
        dict.enumerateKeysAndObjects() {
            key,value,_ in
            print("key \(key) : value \(value)")
        }
        
    }
    
}
