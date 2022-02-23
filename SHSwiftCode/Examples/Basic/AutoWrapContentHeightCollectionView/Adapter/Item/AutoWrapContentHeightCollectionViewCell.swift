//
//  AutoWrapContentHeightCollectionViewCell.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/06/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class AutoWrapContentHeightCollectionViewCell: UICollectionViewCell {

    public static let TAG = "AutoWrapContentHeightCollectionViewCell"
    
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelNickname: UILabel!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelContent: UILabel!
    
    public var autoWrapModelItem: AutoWrapModelItem?
    
    private var heightConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 130).isActive = true
        
        layoutIfNeeded()
    }

    public func updateView() {
        
        imageView.image = UIImage(named: autoWrapModelItem!.imageName)
        labelNickname.text = autoWrapModelItem?.nickname
        labelDate.text = autoWrapModelItem?.dateString
        labelTitle.text = autoWrapModelItem?.title
        labelContent.text = autoWrapModelItem?.content
        
        labelContent.sizeToFit()
        
        layoutIfNeeded()
    }
    
}
