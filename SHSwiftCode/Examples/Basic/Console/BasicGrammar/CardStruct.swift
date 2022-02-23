//
//  Card.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 25/07/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

/*
 结构体和类有很多相同的地方，包括方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
 */
struct Card {
    
    var rank: Rank
    
    func simpleDescription() -> String {
        return rank.simpleDescription()
    }
}
