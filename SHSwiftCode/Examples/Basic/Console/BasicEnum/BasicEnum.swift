//
//  BasicEnum.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 23/06/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

enum SomeEnum {
    case up, down, left, right
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

class BasicEnum {
    
    func enumWithSwitch(someEnum: SomeEnum) {
        
        switch someEnum {
            
            case SomeEnum.up:
                print("up")
            
            case SomeEnum.down:
                print("down")
            
            case SomeEnum.left:
                print("left")
            
            case SomeEnum.right:
                print("right")
        }
    }
    
    /*
        遍历一个枚举需要枚举实现一个CaseIterable协议
    */
    func enumAllCase() {
        for enumItem in Beverage.allCases {
            print(enumItem)
        }
    }
}
