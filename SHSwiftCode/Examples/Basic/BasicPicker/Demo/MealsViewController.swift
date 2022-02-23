//
//  MealsViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/28.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation
import UIKit

class MealsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    let meals = ["早餐","午餐","晚餐","宵夜"]
    var formatter: DateFormatter! = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createMealsPickerView()
        createDatePickerView()
    }
    
    private func createMealsPickerView() {
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        // create UITextField
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 将 UITextField 原先弹出的软键盘 改编成 UIPickerView
        textField.inputView = pickerView
        
        textField.text = meals[0]
        
        textField.tag = 100
        
        textField.backgroundColor = UIColor.init(
          red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        textField.textAlignment = NSTextAlignment.center
        textField.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(textField)
    }
    
    private func createDatePickerView() {
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy 年 MM 月 dd 日"
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.locale = Locale(identifier: "zh_TW")
        
        datePicker.date = Date()
        datePicker.addTarget(self, action: #selector(self.datePickerChanged(datePicker:)), for: UIControl.Event.valueChanged)
        
        // 将 UITextField 原先的软键盘变成 UIDatePicker
        textField.inputView = datePicker

        textField.text = formatter.string(from: datePicker.date)

      
        textField.tag = 200

      
        textField.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        textField.textAlignment = NSTextAlignment.center
        textField.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.25)
        self.view.addSubview(textField)
    }
    
    @objc private func datePickerChanged(datePicker:UIDatePicker) {
      
        let textField = self.view?.viewWithTag(200) as? UITextField

        textField?.text = formatter.string(from: datePicker.date)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return meals.count
    }
    
    /*
     UIPickerView 滚动时
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return meals[row]
    }

    /*
     UIPickerView 完成选择后
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        // 通过 tag 找到 view
        let textField = self.view?.viewWithTag(100) as? UITextField

        textField?.text = meals[row]
    }
}
