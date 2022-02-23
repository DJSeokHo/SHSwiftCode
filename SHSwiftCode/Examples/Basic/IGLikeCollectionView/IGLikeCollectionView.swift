//
//  IGLikeCollectionView.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/01/13.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class IGLikeCollectionView: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
//    var gridLayout: UICollectionViewFlowLayout!
    var gridLayout: IGLikeCollectionViewLayout!
    var listLayout: UICollectionViewFlowLayout!
    
    var list: Array<String> = Array<String>()
    
    private var isGrid = true
  
    @IBAction func changeLayout(_ sender: Any) {
        
        isGrid = !isGrid
        
        AnimationUtility.withoutAnimation {
            if self.isGrid {
                self.collectionView.setCollectionViewLayout(self.gridLayout, animated: true, completion: { (com) in
                        if com {
                            self.collectionView.reloadData()
                        }
                })
            }
            else {
                self.collectionView.setCollectionViewLayout(self.listLayout, animated: true, completion: { (com) in
                        if com {
                            self.collectionView.reloadData()
                        }
                })
            }
        }
        
    }
    
    @IBAction func reload(_ sender: Any) {
        
        let list = loadMore(offset: 0, limit: 30)
        
        self.list.removeAll()
        self.list.append(contentsOf: list)
        
        collectionView.reloadData()
    }
    
    @IBAction func test(_ sender: Any) {
        
        let list = loadMore(offset: self.list.count, limit: 20)
        
        var paths = [IndexPath]()
        for i in 0..<list.count {
            let indexPath = IndexPath(row: i + self.list.count, section: 0)
            paths.append(indexPath)
        }
        
        self.list.append(contentsOf: list)
        
        AnimationUtility.withoutAnimation {
            self.collectionView.insertItems(at: paths)
        }
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        initList()
        
        for i in 0..<30 {
            list.append("index \(i)")
        }
        
        collectionView.reloadData()
        
    }
    
    private func loadMore(offset: Int, limit: Int) -> [String] {
        
        var list: [String] = []
        for i in offset..<(offset + limit) {
            list.append("index \(i)")
        }
        
        return list
    }


    private func initList() {
       
        list.removeAll()
        
        // init list layout
        listLayout = UICollectionViewFlowLayout()
        listLayout.minimumLineSpacing = 0
        listLayout.minimumInteritemSpacing = 0
        listLayout.itemSize = CGSize(width: CGFloat(DisplayUtility.getFullScreenSize().width), height: CGFloat(DisplayUtility.getFullScreenSize().width))
        
        
        // init grid layout
//        gridLayout = UICollectionViewFlowLayout()
        gridLayout = IGLikeCollectionViewLayout()
        gridLayout.minimumLineSpacing = 0
        gridLayout.minimumInteritemSpacing = 0
//        gridLayout.itemSize = CGSize(width: CGFloat(DisplayUtil.getFullScreenSize().width) / 3.0 - 2, height: CGFloat(DisplayUtil.getFullScreenSize().width) / 3.0 - 2)
        gridLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        
        collectionView.collectionViewLayout = gridLayout
        
        collectionView.register(UINib(nibName: IGLikeListCollectionViewCell.TAG, bundle: nil), forCellWithReuseIdentifier: IGLikeListCollectionViewCell.TAG)
        collectionView.register(UINib(nibName: IGLikeCollectionViewCell.TAG, bundle: nil), forCellWithReuseIdentifier: IGLikeCollectionViewCell.TAG)
        
        collectionView.delegate = self
        collectionView.dataSource = self
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
