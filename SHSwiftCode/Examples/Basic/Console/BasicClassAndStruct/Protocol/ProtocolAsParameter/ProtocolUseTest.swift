//
//  ProtocolUseTest.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/08.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation

class ProtocolUseTest {
    
    init() {
        
    }
    
    public func printInfo(protocolTest: ProtocolTest) {
        protocolTest.printProtocolInfo()
    }
    
    deinit {
        print("deinit")
    }
}
