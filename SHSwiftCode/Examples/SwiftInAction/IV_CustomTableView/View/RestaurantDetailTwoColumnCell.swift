//
//  RestaurantDetailTwoColumnCell.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/17.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class RestaurantDetailTwoColumnCell: UITableViewCell {

    @IBOutlet var labelAddress: UILabel! {
        didSet {
            labelAddress.text = labelAddress.text?.uppercased()
            labelAddress.numberOfLines = 0
        }
    }
    @IBOutlet var labelFullAddress: UILabel! {
        didSet {
            labelFullAddress.numberOfLines = 0
        }
    }
    
    @IBOutlet var labelPhone: UILabel! {
        didSet {
            labelPhone.text = labelPhone.text?.uppercased()
            labelPhone.numberOfLines = 0
        }
    }
    @IBOutlet var labelPhoneNumber: UILabel! {
        didSet {
            labelPhoneNumber.numberOfLines = 0
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
