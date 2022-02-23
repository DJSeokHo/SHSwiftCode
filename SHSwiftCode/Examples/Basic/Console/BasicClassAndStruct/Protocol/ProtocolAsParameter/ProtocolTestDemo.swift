//
//  ProtocolTestDemo.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/08.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation

class ProtocolTestDemo {
    
    public func test() {
        
        let protocolUseTest = ProtocolUseTest()
        protocolUseTest.printInfo(protocolTest: ProtocolTestImpl())
    }
    
}
