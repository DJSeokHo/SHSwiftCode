//
//  Employee.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 29/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class Employee {
    var name = ""
    var title = ""
    var company: Company!
    
    init(name: String, title: String) {
        self.name = name
        self.title = title
    }
    
    func info() {
        print("employee is \(name) title is \(title)")
    }
}
