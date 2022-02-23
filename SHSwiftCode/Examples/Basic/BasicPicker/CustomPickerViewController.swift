//
//  CustomPickerViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/25.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation
import UIKit

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let week = ["星期日","星期一","星期二","星期三", "星期四","星期五","星期六"]
    private let meals = ["早餐","午餐","晚餐","宵夜"]
    private var whatDay = "星期日"
    private var whatMeal = "早餐"
    
    
    /*
     UIPickerView 有几列可以选择
     */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    /*
     UIPickerView 每列各有多少行
     */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            // 第一列时，返回 week 长度
            return week.count
        }
        
        // 第二列时，返回 meals 长度
        return meals.count
    }
    
    /*
     UIPickerView 滚动时，获取每一行的资料
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        ILog.debug(tag: "pickerView", content: "titleForRow \(row)")
        
        if component == 0 {
            // 第一列时，返回 week
            return week[row]
        }
        
        // 第二列时，返回 meals
        return meals[row]
        
    }
    
    /*
     UIPickerView 改变选择后触发
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        ILog.debug(tag: "pickerView", content: "didSelectRow \(row)")
        
        // 第一列时，获取 week
        if component == 0 {
            whatDay = week[row]
        }
        else {
            // 获取 meals
            whatMeal = meals[row]
        }
        
        print("select \(whatDay) \(whatMeal)")
    }
    
}
