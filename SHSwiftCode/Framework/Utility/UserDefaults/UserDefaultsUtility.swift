//
//  UserDefaultsUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 18/08/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class UserDefaultsUtility {
    
    public static func save(key: String, andValue value: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    public static func save(key: String, andValue value: Int) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    public static func save(key: String, andValue value: Float) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    public static func save(key: String, andValue value: Double) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    public static func save(key: String, andValue value: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    public static func get(key: String) -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: key) ?? ""
    }
    
    public static func get(key: String) -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: key)
    }
    
    public static func get(key: String) -> Float {
        let defaults = UserDefaults.standard
        return defaults.float(forKey: key)
    }
    
    public static func get(key: String) -> Double {
        let defaults = UserDefaults.standard
        return defaults.double(forKey: key)
    }
    
    public static func get(key: String) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key) 
    }
}
