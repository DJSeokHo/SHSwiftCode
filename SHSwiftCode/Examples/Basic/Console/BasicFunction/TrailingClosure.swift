//
//  TrailingClosure.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 06/10/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class TrailingClosure {
    
    func getMathFunc(_ value: Int, fn: (Int) -> Int) -> Int {
        return fn(value)
    }
    
}
