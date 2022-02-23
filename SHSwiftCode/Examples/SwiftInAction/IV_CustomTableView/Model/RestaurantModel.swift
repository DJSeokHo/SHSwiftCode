//
//  RestaurantModel.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2022/02/13.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation

struct RestaurantModel: Hashable {
    
    var name: String = ""
    var type: String = ""
    var location: String = ""
    
    var phone: String = ""
    var description: String = ""
    
    var image: String = ""
    var isFavorite: Bool = false
    
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
