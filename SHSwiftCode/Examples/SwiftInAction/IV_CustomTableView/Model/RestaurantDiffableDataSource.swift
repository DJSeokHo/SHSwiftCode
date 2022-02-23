//
//  RestaurantDiffableDataSource.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/15.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, RestaurantModel> {
    
    // MARK: 让列表项变得可以编辑 (为了拖动删除功能)
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: 如果只是简单的删除操作，这个不适合，所以注释掉了
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            /*
//             因為我們只對刪除操作有興趣，在執行程式區塊前，我們檢查editingStyle 的值。要找出所選的餐廳，我們以當下的 indexPath 呼叫 itemIdentifier 方法。
//
//             這個方法回傳給我們一個 optional，表是它可以回傳 Restaurant 物件或者空值。這也是為何我們使用 if let 敘述來執行驗證的原因。當我們選好餐廳後，我們呼叫 snapshot() 方法來取得資料源當下快照的副本。然後我們呼叫deleteItems 來刪除餐廳。最後，我們以更新的快照來呼叫 apply 方法以要求表格視圖更新它的 UI。注意我們這裡也透過將 animatingDifferences 設定為 true 來要求表格視圖以動畫方式來做變更
//             */
//            if let resturant = self.itemIdentifier(for: indexPath) {
//
//                var snapshot = self.snapshot()
//                snapshot.deleteItems([resturant])
//                self.apply(snapshot, animatingDifferences: true)
//            }
//        }
//    }
    
    // MARK: 别忘记设置 tableView.delegate = dataSource, 即: UITableViewDelegate别忘记设置给tableview
//    @available(iOS 11.0, *)
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        // 取得所選的餐廳
//        guard let restaurant = self.itemIdentifier(for: indexPath) else {
//            return UISwipeActionsConfiguration()
//        }
//
//        // 删除动作
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {
//            (action, sourceView, completionHandler) in
//
//            var snapshot = self.snapshot()
//            snapshot.deleteItems([restaurant])
//            self.apply(snapshot, animatingDifferences: true)
//
//            // 呼叫完成处理器来取消动作按钮
//            completionHandler(true)
//        })
//        deleteAction.backgroundColor = .red
//
//
//        // 分享动作
//        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {
//            (action, sourceView, completionHandler) in
//
//            let defaultText = "Just checking in at " + restaurant.name
//
//            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
//            self.present(activityController, animated: true, completion: nil)
//
//            // 呼叫完成处理器来取消动作按钮
//            completionHandler(true)
//        })
//        deleteAction.backgroundColor = .red
//
//
//        // 添加动作
//        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
//        swipeConfiguration.performsFirstActionWithFullSwipe = false
//        return swipeConfiguration
//    }
//
//    // MARK: 别忘记设置 tableView.delegate = dataSource, 即: UITableViewDelegate别忘记设置给tableview
//    @available(iOS 11.0, *)
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        return nil
//    }
}
