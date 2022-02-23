//
//  SIACustomTableViewCell.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/09.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class SIACustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /*
         改变cell 右边区域 控件的颜色
         */
        self.tintColor = .systemYellow
    }
    
    @IBOutlet var thumbnailImageView: UIImageView! {
        
        /*
         这里是用代码的方式来弄圆角图片
         
         也可以在storyboard里
         至識別檢閱器，點選「User Defined Runtime Attributes」編輯器左下方的「+」按鈕，接著在編輯器中出現一個新的執行期間屬性（Runtime Attributes ）。在新屬性的「Key Path」欄位點選兩下，來編輯屬性的主要路徑，設定值為 cornerRadius，然後按下 Return 鍵來確認。點選「Type」屬性，選取 Number，最後設定其值為 20。
         */
        didSet {
//            thumbnailImageView.roundedCorner(radius: 20)
//            thumbnailImageView.circleClip()
        }
    }
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelLocation: UILabel!
    @IBOutlet var labelType: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
