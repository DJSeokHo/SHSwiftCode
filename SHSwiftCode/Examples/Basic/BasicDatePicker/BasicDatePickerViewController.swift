//
//  BasicDatePickerViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/25.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicDatePickerViewController: UIViewController {

    /*
     yyyy：西元年份，像是 2015、1998
     yy：西元年份末兩位數，像是 15、95
     MMMM：月份，像是 December、January
     MMM：月份簡寫，像是 Oct、Feb
     MM：以數字代表月份，像是 08、12
     dd：日期，像是 07、31
     EEEE：星期幾，像是 Saturday、Monday
     EEE：星期幾的簡寫，像是 Sun、Wed
     HH：24 小時制的時
     hh：12 小時制的時
     mm：分
     ss：秒
     */
    private static let TAG: String = "BasicDatePickerViewController"
    
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var buttonDate: UIButton!
    @IBOutlet var buttonDateTime: UIButton!
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setListener()
        initDatePicker()
    }
    
    private func setListener() {
        buttonDate.addTarget(self, action: #selector(onButtonDateClick), for: UIControl.Event.touchUpInside)
        
        buttonDateTime.addTarget(self, action: #selector(onButtonDateTimeClick), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func onButtonDateClick() {
        datePicker.datePickerMode = UIDatePicker.Mode.date
    }
    
    @objc private func onButtonDateTimeClick() {
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
    }
    
    private func initDatePicker() {
        datePicker.date = Date()
        
        let dateTimeFomatter = DateFormatter()
        dateTimeFomatter.dateFormat = ("yyyy-MM-dd HH:mm:ss")
        
        let minimumDateTime = dateTimeFomatter.date(from: "2016-01-01 00:00:00")
        datePicker.minimumDate = minimumDateTime
        
        let maximumDateTime = dateTimeFomatter.date(from: "2020-01-01 00:00:00")
        datePicker.maximumDate = maximumDateTime
        
        datePicker.locale = Locale(identifier: "zh_TW")
        
        // set date value change listener
        datePicker.addTarget(self, action: #selector(onDatePickerChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc private func onDatePickerChanged() {
        
        let dateTimeFomatter = DateFormatter()
        dateTimeFomatter.dateFormat = ("yyyy-MM-dd HH:mm:ss")
        
        labelDate.text = dateTimeFomatter.string(from: datePicker.date)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
