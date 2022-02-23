//
//  BasicPageDemoViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/05/01.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicPageDemoViewController: UIViewController, UIPageViewControllerDelegate,UIPageViewControllerDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBAction func onButtonCloseClick(_ sender: Any) {
        finish()
    }
    
    private let tag = "BasicPageDemoViewController"
    
    @IBOutlet var contentView: UIView!
    
    var tabLayout: UICollectionView!
    var tabBarTitleArray: [String] = [String]()
    var pageViewControllerItemArray: [UIViewController] = [UIViewController]()
    
    var currentViewControllerIndex = 0
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initData()
        createTabLayout()
        createPageViewController()
      
    }

    private func initData() {
        
        if tabBarTitleArray.count != 0 {
            return
        }
        
        for index in 0..<10 {
            
            let dataViewController = DataViewController()
            dataViewController.text = "page \(index)"
            dataViewController.index = index
            pageViewControllerItemArray.append(dataViewController)
            
            tabBarTitleArray.append("page \(index)")
        }
    }
    
    private func createTabLayout() {
        
        if tabLayout != nil {
            return
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 60, height: 30)
        
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        tabLayout = UICollectionView(frame: CGRect(x: 0, y: 60, width: DisplayUtility.getFullScreenSize().width, height: 30), collectionViewLayout: flowLayout)
        tabLayout.showsHorizontalScrollIndicator = false
        tabLayout.backgroundColor = UIColor.cyan
        tabLayout.delegate = self
        tabLayout.dataSource = self
        
        tabLayout.register(TabLayoutItem.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(tabLayout)
    }
    
    private func createPageViewController() {
        
        if(pageViewController != nil) {
            return
        }
        
        pageViewController = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(pageViewController)
        
        pageViewController.view.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        contentView.addSubview(pageViewController.view)
        
        // 通知子视图控制器已经被加入到父视图控制器中
        pageViewController.didMove(toParent: self)
        
        /*
        假如想要移除一个 子视图控制器，同样需要三个步骤：
        // 通知子视图控制器将要从父视图控制器中移除
        child.willMove(toParentViewController: nil)

        // 移除子视图控制器
        child.removeFromParentViewController()

        // 将子视图控制器的视图也移除
        child.view.removeFromSuperview()
        */
        
        let dataSourceViewController = pageViewControllerItemArray[currentViewControllerIndex]
        
        pageViewController.setViewControllers([dataSourceViewController], direction: UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
    }
    
    // before
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! DataViewController
        var index = vc.index as Int
        
        if( index == 0 || index == NSNotFound) {
            return nil
        }
        index -= 1
        
        return pageViewControllerItemArray[index]
        
    }
    
    // after
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! DataViewController
        var index = vc.index as Int
        
        if(index == NSNotFound) {
            return nil
        }
        index += 1
        
        if(index == self.pageViewControllerItemArray.count){
            return nil
        }
        
        return pageViewControllerItemArray[index]
    }
    
    // completed
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            
            let currentViewController = pageViewController.viewControllers![0] as! DataViewController
            currentViewControllerIndex = currentViewController.index
            
            ILog.debug(tag: tag, content: "current index \(currentViewControllerIndex)")
            
            let indexPath = IndexPath(row: currentViewControllerIndex, section: 0)
            tabLayout.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            tabLayout.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tabBarTitleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = tabLayout.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TabLayoutItem

        cell.content = tabBarTitleArray[indexPath.row];
        
        if (indexPath.row == currentViewControllerIndex) {
            cell.updateView(color: UIColor.black)
        }
        else {
            cell.updateView(color: UIColor.gray)
            
        }

        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dataViewController = pageViewControllerItemArray[indexPath.row]
        
        if indexPath.row > currentViewControllerIndex {
            pageViewController.setViewControllers([dataViewController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        }
        else {
            pageViewController.setViewControllers([dataViewController], direction: UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
        }
        
        currentViewControllerIndex = indexPath.row

        ILog.debug(tag: tag, content: "collectionView click \(currentViewControllerIndex)")
        
        let indexPath: IndexPath = IndexPath(row: currentViewControllerIndex, section: 0)
        
        tabLayout.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        tabLayout.reloadData()
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


class TabLayoutItem: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
    public var content: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let size: CGSize = DisplayUtility.getFullScreenSize()
        ILog.debug(tag: "???", content: size.width)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor.orange
        
        self.addSubview(titleLabel)
    }
    
    public func updateView(color: UIColor) {
        titleLabel.text = content
        titleLabel.textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
