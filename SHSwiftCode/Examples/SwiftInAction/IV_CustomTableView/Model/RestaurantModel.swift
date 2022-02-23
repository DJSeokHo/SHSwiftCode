//
//  RestaurantModel.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2022/02/13.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation

struct RestaurantModel: Hashable {
    
    enum Rating: String {
        
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image: String {
            
            switch self {
                
            case .awesome:
                return "love"
            case .good:
                return "cool"
            case .okay:
                return "happy"
            case .bad:
                return "sad"
            case .terrible:
                return "angry"
            }
            
        }
        
    }
    
    var name: String = ""
    var type: String = ""
    var location: String = ""
    
    var phone: String = ""
    var description: String = ""
    
    var image: String = ""
    var isFavorite: Bool = false
    var rating: Rating?
    
    init() {}

    init(name: String, type: String, location: String, phone: String, description: String, image: String, isFavorite: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isFavorite = isFavorite
    }

}
