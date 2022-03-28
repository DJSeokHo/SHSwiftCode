//
//  ThreadUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 17/08/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class ThreadUtility {
    
    public static func startThread(runnable: @escaping () -> Void) {
        DispatchQueue.global().async {
            runnable()
        }
    }
    
    public static func startUIThread(runnable: @escaping () -> Void, afterSeconds seconds: Double) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            runnable()
        }
    }
    
}
