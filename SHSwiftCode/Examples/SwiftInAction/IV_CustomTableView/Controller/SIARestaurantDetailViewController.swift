//
//  SIARestaurantDetailViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/16.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit

class SIARestaurantDetailViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: SIARestaurantDetailHeaderView!
    
    var resturantModel: RestaurantModel = RestaurantModel()
  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initNavigation()
        initHeader()
        initTableView()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ILog.debug(tag: #file, content: "viewWillAppear")
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func initNavigation() {
        
        // MARK: 是否以滑動方式隱藏導覽列
        navigationController?.hidesBarsOnSwipe = false
        
        // MARK: 停用大标题
        navigationItem.largeTitleDisplayMode = .never
        
        // 设置导航栏为白色
        navigationController?.navigationBar.tintColor = UIColor.white
        
        navigationItem.titleView?.tintColor = .white
        
        // 设置自定义返回键
        if let appearance = navigationController?.navigationBar.standardAppearance {
            
            var backButtonImage = UIImage(
                systemName: "arrow.backward",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .bold)
            )
            
            // MARK: 我們使用 withAlignmentRectInsets 來調整返回按鈕圖片的位置
            // 可以把这个放在AppDelegate里，这样的话就可以作用于整个app
            backButtonImage = backButtonImage?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0))
            appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        
    } 

    func initHeader() {
        
        headerView.labelName.text = resturantModel.name
        headerView.labelType.text = resturantModel.type
        headerView.imageViewHeader.image = UIImage(named: resturantModel.image)

        headerView.buttonHeart.tintColor = resturantModel.isFavorite ? .systemYellow : .white
        headerView.buttonHeart.setImage(
            UIImage(systemName: resturantModel.isFavorite ? "heart.fill" : "heart"),
            for: .normal
        )
        
    }
    
    func initTableView() {
        
        // MARK: 我們想要將表格視圖往上移至畫面的邊緣
        /*
         contentInsetAdjustmentBehavior 屬性的值控制表格視圖內容位移（offset ）的調整。
         預設是設定為.always。在這個情況下，iOS 自動調整表格視圖的內容位移，如此內容便不會被導覽列所擋住。
         現在我們設定 contentInsetAdjustmentBehavior 為「.never」，這告訴 iOS 不要調整內容的區域。
         */
        tableView.contentInsetAdjustmentBehavior = .never
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // MARK: 去掉分割符号
        tableView.separatorStyle = .none
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        
        case "showMap":
            
            let destinationController = segue.destination as! SIAMapViewController
            destinationController.model = resturantModel
         
        case "showReview":

            let destinationController = segue.destination as! SIAReviewViewController
            destinationController.model = resturantModel
            
        default:
            
            break
        }
        
    }
    
    

}

extension SIARestaurantDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell

            cell.labelDescription.text = resturantModel.description
            
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTwoColumnCell.self), for: indexPath) as! RestaurantDetailTwoColumnCell
            
            cell.labelAddress.text = "Address"
            cell.labelFullAddress.text = resturantModel.location
            cell.labelPhone.text = "Phone"
            cell.labelPhoneNumber .text = resturantModel.phone
                
            cell.selectionStyle = .none
            
            return cell
        
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            
            cell.configure(locationString: resturantModel.location)
            cell.selectionStyle = .none
            
            cell.onMapClick = {
                self.performSegue(withIdentifier: "showMap", sender: nil)
            }
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
        
    }
    
}
