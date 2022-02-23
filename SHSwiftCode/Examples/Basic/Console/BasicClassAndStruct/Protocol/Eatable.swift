//
//  Eatable.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 05/10/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

protocol Eatable {
    
    static var TAG: String { get }
    
    var name: String { set get }

    func taste()
    func test(_ massages: String...)
    
    static func info(_ peopleName: String)
}
