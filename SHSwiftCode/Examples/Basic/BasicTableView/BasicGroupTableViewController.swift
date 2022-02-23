//
//  BasicGroupTableViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/23.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicGroupTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    var info: Array<Array<String>> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initDate()
    }
    
    private func initDate() {
        
        info.removeAll()
       
        info.append(["A", "B"])
        info.append(["1", "2", "3", "4"])
        
        info.append(["g", "r", "o", "u", "p"])
        info.append(["g", "r", "o", "u", "p"])
        info.append(["g", "r", "o", "u", "p"])
        info.append(["g", "r", "o", "u", "p"])
        info.append(["g", "r", "o", "u", "p"])
        info.append(["g", "r", "o", "u", "p"])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initList()
    }
    
    private func initList() {
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        let tableView = UITableView(
            frame: CGRect(x: 0, y: 50, width: fullScreenSize.width, height: fullScreenSize.height - 50),
            style: UITableView.Style.grouped)
        
        // 注册 cell item
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 分割线的样式
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        // 分割线的上下左右的间隔
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        
        tableView.allowsSelection = true
        
        tableView.allowsMultipleSelection = false
        
        self.view.addSubview(tableView)
    }

    // group里row的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    // 载入cell并更新cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionIndex = indexPath.section
        let rowIndex = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        // reset
        cell.accessoryType = UITableViewCell.AccessoryType.none
        cell.textLabel?.text = ""
        
        // update
        if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            }
            else if indexPath.row == 1 {
                cell.accessoryType = UITableViewCell.AccessoryType.detailButton
            }
            else if indexPath.row == 2 {
                cell.accessoryType = UITableViewCell.AccessoryType.detailDisclosureButton
            }
            else if indexPath.row == 3 {
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            }
        }
        
        if cell.textLabel != nil {
            
            let label: UILabel = cell.textLabel!
            label.text = "\(info[sectionIndex][rowIndex])"
            
        }
       
        return cell
    }
    
    // cell click listener
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name = info[indexPath.section][indexPath.row]
        print("select item \(name)")
    }
    
    // cell accessory click listener
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let name = info[indexPath.section][indexPath.row]
        print("select accessory is \(name)")
    }
    
    // section number
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    // get section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "字母" : "数字"
        return title
    }
    
    /*
        // 设置每个 section 的 title 为一个 UIView
        // 这个会覆盖简单的文字，这个是自定义View
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return UIView()
        }
        // 设置 section header 的高度
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 80
        }
        // 每个 section 的 footer
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            return "footer"
        }
        // 设置 section 的 footer 為一個 UIView
        // 这个会覆盖简单的文字，这个是自定义View
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            return UIView()
        }
        // 设置 section footer 的高度
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 80
        }
        // 设置 cell 的高度
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
