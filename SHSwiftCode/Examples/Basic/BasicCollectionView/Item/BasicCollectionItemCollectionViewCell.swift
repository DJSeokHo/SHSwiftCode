//
//  BasicCollectionItemCollectionViewCell.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/23.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicCollectionItemCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let size: CGSize = DisplayUtility.getFullScreenSize()
        ILog.debug(tag: "???", content: size.width)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (size.width)/3 - 10, height: (size.width)/3 - 10))
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        self.addSubview(imageView)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: (size.width)/3 - 10, height: 40))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor.orange
        
        self.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
