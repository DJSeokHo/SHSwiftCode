//
//  CollectionAutoLayoutViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/03/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class CollectionAutoLayoutViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var listLayout: UICollectionViewFlowLayout!
    var refreshControl: UIRefreshControl!
    var list = [CALItemBean]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        initList()
        reload()
        
    }
    
    private func initList() {
       
        // init list layout
        listLayout = UICollectionViewFlowLayout()
        listLayout.minimumLineSpacing = 10
        listLayout.minimumInteritemSpacing = 0
//        listLayout.itemSize = CGSize(width: CGFloat(DisplayUtil.getFullScreenSize().width), height: CGFloat(98))
        
        collectionView.collectionViewLayout = listLayout
     
        collectionView.register(UINib(nibName: CALItemCollectionViewCell.TAG, bundle: nil), forCellWithReuseIdentifier: CALItemCollectionViewCell.TAG)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        refreshControl = UIRefreshControl()
        
        collectionView.addSubview(refreshControl)
        
    }
    
    func reload() {
     
        
        ThreadUtility.startThread {
            
            var list = [CALItemBean]()
            
            var bean: CALItemBean
            for i in 0..<50 {
                
                bean = CALItemBean()
                
                if i % 12 == 0 {
                    
                    bean.content = "很多人盛赞 Auto Layout 是比 frame 更优雅的布局方案，我基本认同，不过，首先，Auto Layout 写起来一点都不优雅，一行 frame 代码使用 Auto Layout 需要四行代码，足以让很多人望而却步。所以官方不断在提升添加约束的体验，第三方库也不断地优化添加约束的语法来减轻开发者的痛苦。iOS 9 新推出的 Anchor 在语法上大幅简化了约束的编写，不足之处在于缺乏对multiplier参数的设置，但不管如何优化，frame 一行代码 Auto Layout 还是四行代码。就我个人来讲，非常不喜欢 VFL，代码最啰嗦，写起来简直要命，不过在 Debug 要读懂 Log 就必须了解 VFL 的语法。老实说，使用 frame 时一行代码四个数字就可以确定视图的位置和大小比起有多种可能方案的 Auto Layout 布局实际上要舒心得多，虽然后者可读性更好，不过 frame 往往也是需要计算的，从成本上讲有时候两者挺接近的；Auto Layout 的真正优势在于自动化，我们只需要给系统一堆布局方程式，剩下的事情就不用我们操心了，这在分辨率适配、多视图互相约束协作等方面显得极其高效(优雅)，这也是我能忍受写一堆约束的原因。"
                }
                else if i % 17 == 0 {
                    bean.content = "设置 frame 会自动转化为约束，修改 frame 时也会自动调整约束。这时候就不要再手动添加约束了，你再添加约束往往会造成冲突，注意是往往，因为此时视图上的约束已经是唯一可解的了，你添加的往往是优先级最高的约束，必然造成冲突，在控制台能看到"
                }
                else {
                    bean.content = "index \(i)"
                }
               
                list.append(bean)
            }
            
            ThreadUtility.startUIThread(runnable: {
                
                self.reloadData(list: list)
                
            }, afterSeconds: 0.5)
        }
     
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
