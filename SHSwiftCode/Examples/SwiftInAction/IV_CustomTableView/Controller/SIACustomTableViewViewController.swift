//
//  SIACustomTableViewViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/09.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

/**
 采用 UITableViewController, 协议, tableView的UI连接全部都省了,的确不错.
 
 這是我們如何使用 UITableViewDiffableDataSource 方法於表格視圖中呈現資料的方式， 我們整理一下這個方法的一些步驟：

 建立一個定義表格區塊的列舉。
 建立一個 UITableViewDiffableDataSource 物件來連結你的表格，並提供表格視圖 Cell 的設定方式。
 指定差異性（diffable）資料源至你的表格視圖。
 建立一個快照來產生表格資料的目前狀態。
 呼叫 apply() 函數將資料源填入資料。
 
 “Show - 當使用「Show」樣式時，內容會被推到目前視圖控制器堆疊的上方。在導覽列上會顯示一個返回按鈕，用來導覽回原來的視圖控制器。一般，我們會使用這個作為導覽控制器的 Segue 型態。
 Show detail - 和「Show」樣式類似，不過細節（或是目標）視圖控制器的內容成為目前視圖控制器堆疊的最上方。舉例而言，如果你在 Foodpin App 中選取「Show Detail」型態來取代「Show」型態，則在細節視圖中便不會有導覽列與返回按鈕。
 Present modally - 以強制回應（Modal）型態呈現。使用這個型態，細節視圖控制器將會以動畫方式從底部出現後填滿整個 iPhone 螢幕。「Present Modally」Segue 的較佳範例是內建日曆 App 的「Add」功能。當你在 App 中點選「+」按鈕，它會從底部帶出一個「New Event」畫面。
 Present as popover - 將內容以固定點彈出視窗來呈現內容至目前視圖中。彈出視窗在 iPad App 中很常見。你已經在之前的章節實作過它
 
 Note: 自從 iOS 8 發布後，這些 Segue 型態已經過時了：Push、Modal、Popover、Replace。當你見到「deprecated」這個字時，表示那些函數已經不推薦使用。在未來的 iOS SDK 版本可能會移除它。
 
 */

// MARK: - 視圖控制器生命週期

class SIACustomTableViewViewController: UITableViewController {
    
    public static func start(from parentViewController: UIViewController, withStoryboard: Bool = true) {
        
        var viewController: UIViewController
        
        if withStoryboard {
            viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "SIACustomTableView", withClassName: "SIACustomTableViewViewController") as! SIACustomTableViewViewController
        }
        else {
            viewController = SIACustomTableViewViewController()
        }
        
        parentViewController.presentUIViewController(target: SIACustomNavigationController(rootViewController: viewController))
    }
    
//    var restaurantModelList:[RestaurantModel] = TempData.createTempData()
    var restaurantModelList:[RestaurantModel] = []
    
    public lazy var dataSource = configureDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigation()
        
        initTableView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ILog.debug(tag: #file, content: "viewWillAppear")
        // MARK: 是否以滑動方式隱藏導覽列
        navigationController?.hidesBarsOnSwipe = true
    }
    
    // MARK: 自定义导航
    func initNavigation() {
        
        // MARK: 启用大标题
        navigationItem.largeTitleDisplayMode = .always
        
        // MARK: 设置导航标题文字
        navigationItem.backButtonTitle = "Food Pin"
        
        // MARK: 显示大标题
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 自 iOS 13 開始，Apple 導入了一個可以自訂導覽列的 UINavigationBarAppearance 的類別。你可以將自訂的導覽列應用在獨立的一個視圖或整個 App 上。
        // standard Appearance 屬性包含了目前標準大小導覽列的外觀設定
        if let appearance = navigationController?.navigationBar.standardAppearance {
            
            // 透明背景无阴影
            appearance.configureWithTransparentBackground()
            
            /**
             MARK: 如果 font 无法获取到, 检查以下几点，名字是否正确，是否在info文件里被添加引用 - Fonts provided by application,
             项目设置里, targets, build phases, copy bundle resources里是否存在。
             */
            if let customFont = UIFont(name: "Nunito-Bold", size: 45.0) {
              
//                appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0)]
//                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0), .font: customFont]
                
                // MARK: 改成使用自定义颜色
                appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont]
            }
          
            /*
             即使我們完成了 appearance 物件的修改，自訂的結果不會立即應用於導覽列，
             你必須指定物件至standardAppearance、 compactAppearance 與 scrollEdgeAppearance屬性，
             每一個屬性負責導覽列於不同狀態的外觀。
             standardAppearance 屬性儲存標準尺寸導覽列的設定
             compactAppearance 的設定控制小尺寸導覽列的外觀
             scrollEdgeAppearance 則為滾動內容滾到導覽列邊緣時的外觀設定
             */
            navigationController?.navigationBar.standardAppearance = appearance
            
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    func initTableView() {
        // Do any additional setup after loading the view.
        tableView.dataSource = dataSource
        
        // MARK: 别忘记设置这个
//        tableView.delegate = dataSource
        
        // 移除分割线
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, RestaurantModel>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantModelList, toSection: .all)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    /*
     隱藏狀態列

     表格視圖內容目前會和狀態列重疊，這看起來並不美觀。有一個簡易調整的方式，就是隱藏狀態列。
     每一個視圖控制器的基礎架構上，可以讓你控制其狀態列的外觀，當你不想在某個視圖控制器上顯示狀態列，只要在最後一個大括號（ } ）的前面加入下列這行程式碼即可

     */
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    // MARK: - UITableView 差異性資料源
    func configureDataSource() -> RestaurantDiffableDataSource {
        
        let cellIdentifier = "favoriteCellItem"
        
        let dataSource = RestaurantDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurantModel in
            
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SIACustomTableViewCell
                
                cell.labelName?.text = restaurantModel.name
                cell.thumbnailImageView?.image = UIImage(data: restaurantModel.image)
                cell.labelLocation?.text = restaurantModel.location
                cell.labelType?.text = restaurantModel.type
                
                /*
                 每次 Cell 被重新渲染時，我們檢查餐廳是否顯示被加入最愛，如果動作是 true，我們在 Cell 上顯示一個打勾符號。如果沒有，則不顯示。因為我們參考 restaurantIsFavorites 陣列來查詢餐廳是否有被標註，現在即使Cell 已經被用過，我們已經可以正確地顯示輔助視圖。
                 */
                cell.accessoryType = restaurantModel.isFavorite ? .checkmark : .none
                
                return cell
            }
        )
        
        return dataSource
        
    }
    
    // MARK: - UITableViewDelegate 協定
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        showAction(message: "What do you want to do?", actionArray: ["Reserve a table", "Mark as favorite"], onAction: { _,action in
//            
//            // 加入「訂位」動作
//            if action == "Reserve a table" {
//                self.showAlert(title: "Not available yet", message: "Sorry, this feature is not available yet. Please retry later.", confirmTitle: "OK", onConfirm: { _ in
//                    
//                })
//            }
//         
//            if action == "Mark as favorite" {
//                
//                /*
//                 對於表格視圖 Cell 而言，Cell 的右邊部分是預留給輔助視圖（Accessory View）用的。
//                 有四種內建的輔助視圖，包含了「揭示指示器」（disclosure indicator）、「細節揭示按鈕」（detail disclosure button）、「打勾符號」（checkmark）以及「細節圖示」（detail），而我們使用「checkmark」作為其指示器。
//                 */
//                let cell = tableView.cellForRow(at: indexPath)
//                cell?.accessoryType = .checkmark
//                self.restaurantModelList[indexPath.row].isFavorite = true
//            }
//            
//        }, cancelTitle: "Cancel")
//       
//        // 取消列的选择
//        tableView.deselectRow(at: indexPath, animated: false)
//    }

    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 取得所選的餐廳
        guard let restaurant = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }

        // 删除动作
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {
            (action, sourceView, completionHandler) in

            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([restaurant])
            self.dataSource.apply(snapshot, animatingDifferences: true)

            // 呼叫完成处理器来取消动作按钮
            completionHandler(true)
        })
        deleteAction.backgroundColor = UIColor.systemRed
        deleteAction.image = UIImage(systemName: "trash")
        
        
        // 分享动作
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {
            (action, sourceView, completionHandler) in

            let defaultText = "Just checking in at " + restaurant.name
            
            if let imageToShare = UIImage(data: restaurant.image) {
                self.showActivity(activityItems: [defaultText, imageToShare])
            }
            else  {
                self.showActivity(activityItems: [defaultText])
            }
            
            // 呼叫完成处理器来取消动作按钮
            completionHandler(true)
        })
        shareAction.backgroundColor = UIColor.systemOrange
        shareAction.image = UIImage(systemName: "square.and.arrow.up")


        // 添加动作
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
    }
    
    // MARK: 别忘记设置 tableView.delegate = dataSource, 即: UITableViewDelegate别忘记设置给tableview
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 喜爱
        let likeAction = UIContextualAction(style: .normal, title: "Delete", handler: {
            (action, sourceView, completionHandler) in

            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.restaurantModelList[indexPath.row].isFavorite = true
            
            // 呼叫完成处理器来取消动作按钮
            completionHandler(true)
        })
        likeAction.backgroundColor = UIColor.systemYellow
        likeAction.image = UIImage(systemName: "heart.fill")
        
        // 添加动作
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = true
        return swipeConfiguration
    }
    
  
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! SIARestaurantDetailViewController
                destinationController.resturantModel = self.restaurantModelList[indexPath.row]
            }
        }
    }
   
    @IBAction func onBackToHome(segue: UIStoryboardSegue) {
        
    }
}
