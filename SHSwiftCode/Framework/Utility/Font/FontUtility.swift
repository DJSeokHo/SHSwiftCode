//
//  FontUtility.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/17.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation
import UIKit

class FontUtility {
    
    /**
     文字樣式（或動態型態）要使用自訂字型的話，我們先在 Info.plist，也就是在 Xcode 專案的設定處設置字型檔，在專案導覽器，選取 Info.plist，於任一空白處按下右鍵來開啟內容選單，選取「Add row」在檔案中建立一個新列。
     
     接著，於 Key 欄位輸入「Fonts provided by application」。為了註冊這些字型檔，我們需要加入鍵（key ）並指定所有字型檔。在你加入鍵後，點選顯示按鈕來展開它。對於 item 0，設定其值為 Nunito-Regular.ttf。你可以點選 item 0 的 + 按鈕來加入另一個項目， 而 item 1，設定值為 Nunito-Bold.ttf
     */
    public static func setFont(label: UILabel, fontName: String, size: CGFloat, textStyle: UIFont.TextStyle) {
        
        if let customFont = UIFont(name: fontName, size: size) {
            label.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: customFont)
        }
    }
    
}
