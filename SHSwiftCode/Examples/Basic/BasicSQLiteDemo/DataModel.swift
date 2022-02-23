//
//  DataModel.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/25.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation

class DataModel {
    
    public var uuid: String!
    public var name: String!
    public var content: String!
    public var dateTime: String!
    
    init(uuid: String, name: String, content: String, dateTime: String) {
        self.uuid = uuid
        self.name = name
        self.content = content
        self.dateTime = dateTime
    }
    
    public func toString() -> String {
//        return uuid + " " + name + " " + content + " " + dateTime
        return ""
    }
}
