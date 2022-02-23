//
//  SIARestaurantDetailHeaderView.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/16.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class SIARestaurantDetailHeaderView: UIView {

    @IBOutlet var imageViewHeader: UIImageView!
    @IBOutlet var imageViewRating: UIImageView!
    
    @IBOutlet var labelName: UILabel! {
        didSet {
            // MARK: iOS 中的標籤可以多行顯示，你只需要將值變更為 0。在這種情況下，標籤會自動判斷全部的行數來符合它的內容。
            labelName.numberOfLines = 0
            
            FontUtility.setFont(label: labelName, fontName: "Nunito-Bold", size: 40.0, textStyle: .title1)
        }
    }
    @IBOutlet var labelType: UILabel! {
        didSet {
            FontUtility.setFont(label: labelType, fontName: "Nunito-Bold", size: 20.0, textStyle: .headline)
        }
    }
    @IBOutlet var buttonHeart: UIButton!

}
