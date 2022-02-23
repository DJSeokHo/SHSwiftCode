//
//  User.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 28/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class User {
    var first: String = ""
    var last: String = ""
    
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
    
    /*
     带set和get的属性
    */
    var fullName: String {
        get {
            return first + "-" + last
        }
        
        set(newValue) {
            self.first = String(newValue.split(separator: "-")[0])
            self.last = String(newValue.split(separator: "-")[1])
        }
    }
    
    /*
     如果没有set,那么这个值就是只读的
    */
    var readOnlyInfo: String {
        get {
            return "info: \(first) \(last)"
        }
    }
    
    init(first: String, last: String) {
        self.first = first
        self.last = last
    }
}
