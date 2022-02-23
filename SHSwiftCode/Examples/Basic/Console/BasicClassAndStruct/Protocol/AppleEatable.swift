//
//  AppleEatable.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 05/10/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class AppleEatable: Eatable {
    
    public static var TAG: String = "AppleEatable"
    
    public var name: String = ""
    
    public func taste() {
        print("apple taste")
    }
 
    public func test(_ massages: String...) {
        
        for message in massages {
            print(message)
        }
    }
    
    public static func info(_ peopleName: String) {
        print("Hey \(peopleName), this is apple")
    }
    
    public func drop() {
        print("drop me")
    }
}
