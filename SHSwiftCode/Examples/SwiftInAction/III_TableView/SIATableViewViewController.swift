//
//  SIATableViewViewController.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2022/02/06.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class SIATableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public static func start(from parentViewController: UIViewController, withStoryboard: Bool = true) {
        
        var viewController: UIViewController
        
        if withStoryboard {
            viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "SIATableView", withClassName: "SIATableViewViewController") as! SIATableViewViewController
        }
        else {
            viewController = SIATableViewViewController()
        }
        
        parentViewController.presentUIViewController(target: viewController)
    }
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    @IBOutlet var tableView: UITableView!
    
    /*
     隱藏狀態列

     表格視圖內容目前會和狀態列重疊，這看起來並不美觀。有一個簡易調整的方式，就是隱藏狀態列。每一個視圖控制器的基礎架構上，可以讓你控制其狀態列的外觀，當你不想在某個視圖控制器上顯示狀態列，只要在最後一個大括號（ } ）的前面加入下列這行程式碼即可

     */
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         iPad 的運作

         你曾試著在iPad 上執行 App 嗎？目前看起來還不錯，但因為 Cell 會依照裝置的寬度來延展，所以你會發現 Cell 有點長，尤其是你將 iPad 裝置轉向後更為明顯。

         自 iOS 9 之後的版本，你可以使用 cellLayoutMarginsFollowReadableWidth 屬性來自動調整 Cell 寬度。
         */
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellItem" // 这里和在storyboard里设置的cell id 一致
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = restaurantNames[indexPath.row]
//        cell.imageView?.image = UIImage(named: "restaurant")
        cell.imageView?.image = UIImage(named: restaurantNames[indexPath.row])
        
        return cell
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
