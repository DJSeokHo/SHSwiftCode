//
//  AutoWrapContentHeightCollectionViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/06/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class AutoWrapContentHeightCollectionViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var listLayout: UICollectionViewFlowLayout!
    var refreshControl: UIRefreshControl!
    var list = [AutoWrapModelItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideSystemNavigationBar()
        // Do any additional setup after loading the view.
        initList()
        reload()
    }

    private func initList() {
       
        // init list layout
        listLayout = UICollectionViewFlowLayout()
        listLayout.minimumLineSpacing = 0
        listLayout.minimumInteritemSpacing = 0
        listLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 130)
        
        collectionView.collectionViewLayout = listLayout
        collectionView.register(UINib(nibName: AutoWrapContentHeightCollectionViewCell.TAG, bundle: nil), forCellWithReuseIdentifier: AutoWrapContentHeightCollectionViewCell.TAG)
        
        collectionView.contentInsetAdjustmentBehavior = .always
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        refreshControl = UIRefreshControl()
        
        collectionView.addSubview(refreshControl)
        
    }
    
    @objc func reload() {
        
        var list = [AutoWrapModelItem]()
        for i in 0..<10 {
            let autoWrapModelItem = AutoWrapModelItem()
           
            autoWrapModelItem.nickname = "\(i) \(String.random(length: 10))"
            autoWrapModelItem.dateString = DateUtility.getCurrentDateTimeStringWithStandardSQLiteDateTimeFromatter()
            autoWrapModelItem.title = "\(i) title \(String.random(length: 6))"
            autoWrapModelItem.content = String.random(length: 600)
            
            if i % 2 == 0 {
                autoWrapModelItem.imageName = "test_image_1.png"
            }
            else if i % 3 == 0 {
                autoWrapModelItem.imageName = "test_image_2.png"
            }
            else {
                autoWrapModelItem.imageName = "test_image_3.png"
            }
            
            list.append(autoWrapModelItem)
        }
        
        ThreadUtility.startUIThread(runnable: {
            
            self.reloadData(list: list)
           
        }, afterSeconds: 0)
    }
    
    func loadMore() {
        
        var list = [AutoWrapModelItem]()
        for i in self.list.count..<(self.list.count + 10) {
            let autoWrapModelItem = AutoWrapModelItem()
           
            autoWrapModelItem.nickname = String.random(length: 10)
            autoWrapModelItem.dateString = DateUtility.getCurrentDateTimeStringWithStandardSQLiteDateTimeFromatter()
            autoWrapModelItem.title = "title \(String.random(length: 6))"
            autoWrapModelItem.content = String.random(length: 600)
            
            if i % 2 == 0 {
                autoWrapModelItem.imageName = "test_image_1.png"
            }
            else if i % 3 == 0 {
                autoWrapModelItem.imageName = "test_image_2.png"
            }
            else {
                autoWrapModelItem.imageName = "test_image_3.png"
            }
            
            list.append(autoWrapModelItem)
        }
        
        ThreadUtility.startUIThread(runnable: {
            
            self.loadMoreData(list: list)
           
        }, afterSeconds: 0)
        
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
