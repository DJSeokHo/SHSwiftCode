//
//  PermissionUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2020/05/06.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation
import UIKit

class PermissionUtility {
    
    public static func openAppSettingPage() {
        
        if #available(iOS 10, *) {
            UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:],
                                      completionHandler: {
                                        (success) in
            })
        }
        else {
            UIApplication.shared.openURL(URL.init(string: UIApplication.openSettingsURLString)!)
        }
        
    }
}
