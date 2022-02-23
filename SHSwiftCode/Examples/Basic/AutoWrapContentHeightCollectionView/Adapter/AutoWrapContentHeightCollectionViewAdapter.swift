//
//  AutoWrapContentHeightCollectionViewAdapter.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/06/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation
import UIKit

extension AutoWrapContentHeightCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // pull to refresh
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       
        if refreshControl.isRefreshing {
            
            ILog.debug(tag: #file, content: "reload")
             
            self.reload()
            self.refreshControl.endRefreshing()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        weak var cell = collectionView.dequeueReusableCell(withReuseIdentifier: AutoWrapContentHeightCollectionViewCell.TAG, for: indexPath) as? AutoWrapContentHeightCollectionViewCell
        
        cell?.autoWrapModelItem = list[indexPath.row]
        cell?.updateView()
       
        if indexPath.row == list.count - 1 {
            ILog.debug(tag: #file, content: "load more")
            loadMore()
        }
        
        return cell ?? AutoWrapContentHeightCollectionViewCell()
    
    }
    
    func reloadData(list: [AutoWrapModelItem]) {
        self.list.removeAll()
        self.list.append(contentsOf: list)
        collectionView.reloadData()
    }
    
    func loadMoreData(list: [AutoWrapModelItem]) {
        
        if list.count == 0 {
            return
        }
        
        self.list.append(contentsOf: list)
        
        self.collectionView.performBatchUpdates({
            self.collectionView?.insertItems(at: [IndexPath(row: self.list.count - 1, section: 0)])
        }, completion: nil)
    }
    
}

