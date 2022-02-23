//
//  IGLikeCollectionViewCell.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/01/13.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class IGLikeCollectionViewCell: UICollectionViewCell {
    
    public static let TAG = "IGLikeCollectionViewCell"

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
