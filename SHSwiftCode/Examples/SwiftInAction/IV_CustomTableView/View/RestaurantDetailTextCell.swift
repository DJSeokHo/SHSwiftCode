//
//  RestaurantDetailTextCell.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/17.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {

    @IBOutlet var labelDescription: UILabel! {
        didSet {
            labelDescription.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
