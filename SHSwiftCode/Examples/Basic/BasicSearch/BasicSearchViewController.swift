//
//  BasicSearchViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/24.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicSearchViewController: UIViewController {
    
    private static let TAG = "BasicSearchViewController"
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    

    public var tableView: UITableView!
    public var searchController: UISearchController!
    
    public var cities: [String]!
    
    public var searchArrry: [String] = [String](){
        didSet {
            // 重设 searchArr 後重整 tableView
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initDate()
        initView()
    }

    private func initDate() {
      
        cities = [String]()
        
        cities.append("GUI YANG")
        cities.append("GUI LING")
        cities.append("AABC")
        cities.append("AABBB")
    }
    
    private func initView() {
        
        let fullScreenSize = DisplayUtility.getFullScreenSize()
        
        self.tableView = UITableView(
            frame: CGRect(x: 0, y: 50, width: fullScreenSize.width, height: fullScreenSize.height - 50),
            style: UITableView.Style.plain)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 在扩展里实现了delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        // 建立 UISearchController 并设置控制器为 nil
        searchController = UISearchController(searchResultsController: nil)
        
        // 将更新结果的delegate 设置为self
        // 在扩展里实现了delegate
        searchController.searchResultsUpdater = self
        
        // 搜索时是否隐藏 navigationBar
        // 这个例子没有用导航，所以没有影响
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchBar.searchBarStyle = UISearchBar.Style.prominent
        
        // 设置搜索框尺寸为自适应
        // 因为会在 tableView 的 header
        // 所以尺寸和 tableView 的 header 一致
        searchController.searchBar.sizeToFit()
        
        // 将搜索框加载在 tableView 的 header
        self.tableView.tableHeaderView = searchController.searchBar
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
