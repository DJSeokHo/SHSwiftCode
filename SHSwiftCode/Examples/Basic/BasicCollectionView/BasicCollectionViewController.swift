//
//  BasicCollectionViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/23.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private static let TAG: String = "BasicCollectionViewController"
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    private var fullScreenSize: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullScreenSize = DisplayUtility.getFullScreenSize()
        
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initCollectionView()
    }
    
    private func initCollectionView() {
        
        // 建立流布局
        let layout = UICollectionViewFlowLayout()
        
        // 设置section的间距
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        // 设置每一行间距
        layout.minimumLineSpacing = 5
        
        // 设置cell的尺寸
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width) / 3 - 10, height: CGFloat(fullScreenSize.height) / 3 - 10)
        
        // 设置header和footer的尺寸
        layout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        layout.footerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        
        // 建立collection view，别忘记layout
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 50, width: fullScreenSize.width, height: fullScreenSize.height - 50),
            collectionViewLayout: layout)
     
        // 注册 自定义 cell
        collectionView.register(BasicCollectionItemCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // 注册 section 的 header 和 footer
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "header")
        
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: "footer")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
    }

    /*
     每一组section有几个cell
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BasicCollectionItemCollectionViewCell
        
        if indexPath.item % 2 == 0 {
            cell.imageView.image = UIImage(named: "test_image_1.png")
            cell.titleLabel.text = "test_image_1"
        }
        else if indexPath.item % 3 == 0 {
            cell.imageView.image = UIImage(named: "test_image_3.png")
            cell.titleLabel.text = "test_image_3"
        }
        else {
            cell.imageView.image = UIImage(named: "test_image_2.png")
            cell.titleLabel.text = "test_image_2"
        }
        
        return cell
    }

    /*
     有几个section
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    /*
     点击cell之后
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select section \(indexPath.section) item \(indexPath.item)")
    }
    
    // 设置header和footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView = UICollectionReusableView()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        label.textAlignment = NSTextAlignment.center
        
        if kind == UICollectionView.elementKindSectionHeader {
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
            
            reusableView.backgroundColor = UIColor.darkGray
            label.text = "header"
            label.textColor = UIColor.white
        }
        else if kind == UICollectionView.elementKindSectionFooter {
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath)
            
            reusableView.backgroundColor = UIColor.cyan
            label.text = "footer"
            label.textColor = UIColor.black
        }
        
        reusableView.addSubview(label)
        
        return reusableView
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
