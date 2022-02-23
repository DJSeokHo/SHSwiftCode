//
//  IGLikeListCollectionViewCell.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/01/15.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class IGLikeListCollectionViewCell: UICollectionViewCell {

    public static let TAG = "IGLikeListCollectionViewCell"
    
    @IBOutlet var label: UILabel!
    
    public var content = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func updateView() {
        
        label.text = content
        
    }

}
