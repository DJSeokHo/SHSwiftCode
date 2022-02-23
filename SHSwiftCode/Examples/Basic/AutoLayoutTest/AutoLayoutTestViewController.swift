//
//  AutoLayoutTestViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/01/19.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class AutoLayoutTestViewController: UIViewController {

    @IBOutlet var viewTop: UIView!
    @IBOutlet var viewHeader: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var labelTest: UILabel!
    
//    private var labelLCBig: NSLayoutConstraint!
//    private var labelLCSmall: NSLayoutConstraint!
    
    // 在NIB设置约束时，高度的值是初始化的值，如果以后这个高度会比初始化的值大，那么必须设置为 >= 才行！！！！！
    private var viewTopLC: NSLayoutConstraint!
    private var labelLC: NSLayoutConstraint!
    private var labelTestLC: NSLayoutConstraint!
    
    private var height: CGFloat = 0
    
    private var isBig = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "这是因为:你在storyboard设置的约束是这样处理的:你在 viewDidLoad中修改的约束的代码块运行了,但是 运行完之后 又被 storyboard自己的配置给覆盖了,所以 你看到的还是你之前设置的约束!解决办法:让修改  constant值或者约束的语句延迟执行即可!即使是 0.1秒,也能让 在storyboard初始完成之后你再修改相应的约束,这样就不会被覆盖掉了!"
        
        labelTest.text = "这是因为:你在storyboard设置的约束是这样处理的:你在 viewDidLoad中修改的约束的代码块运行了,但是 运行完之后 又被 storyboard自己的配置给覆盖了,所以 你看到的还是你之前设置的约束!解决办法:让修改  constant值或者约束的语句延迟执行即可!即使是 0.1秒,也能让 在storyboard初始完成之后你再修改相应的约束,这样就不会被覆盖掉了!"
        
        height = "这是因为:你在storyboard设置的约束是这样处理的:你在 viewDidLoad中修改的约束的代码块运行了,但是 运行完之后 又被 storyboard自己的配置给覆盖了,所以 你看到的还是你之前设置的约束!解决办法:让修改  constant值或者约束的语句延迟执行即可!即使是 0.1秒,也能让 在storyboard初始完成之后你再修改相应的约束,这样就不会被覆盖掉了!".height(withConstrainedWidth: DisplayUtility.getFullScreenSize().width - 40, font: UIFont.systemFont(ofSize: 13))
        
//        labelLCBig = AutoLayoutManager.instance.createLayoutConstraintHeight(view: label, height: height)
//        labelLCSmall = AutoLayoutManager.instance.createLayoutConstraintHeight(view: label, height: 20)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        labelLCBig.isActive = true
        
        labelLC = AutoLayoutManager.instance.createLayoutConstraintHeight(view: label)
        viewTopLC = AutoLayoutManager.instance.createLayoutConstraintHeight(view: viewTop)
        labelTestLC = AutoLayoutManager.instance.createLayoutConstraintHeight(view: labelTest)
//        labelTestLC.isActive = true
        
        // Do any additional setup after loading the view.
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        view.backgroundColor = UIColor.red
//
//        self.view.addSubview(view)
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
////        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
//        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
    }

    @IBAction func onLeftButtonClick(_ sender: Any) {
        
        viewHeader.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        
    }
    
    @IBAction func onRightButtonClick(_ sender: Any) {
        
//        label.heightAnchor.constraint(equalToConstant: 20).isActive = false
//
//        label.heightAnchor.constraint(equalToConstant: height).isActive = true
        
//        label.removeConstraint(labelLC)
//
//        label.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        isBig = !isBig
        
//        if isBig {
////            labelLCBig.isActive = true
////            labelLCSmall.isActive = false
//        }
//        else {
////            labelLCBig.isActive = false
////            labelLCSmall.isActive = true
//        }
        
        labelTestLC.constant = isBig ? height : 20
        
        UIView.animate(withDuration: 0.1, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: {
            _ in
            
            self.viewTopLC.constant = self.isBig ? 60 + self.height : 60
            self.labelLC.constant = self.isBig ? self.height : 20
            
            UIView.animate(withDuration: 0.1, animations: {
                
                self.view.layoutIfNeeded()
                
            }, completion: nil)
        })
        
        
      
        ILog.debug(tag: #file, content: "???? isBig ? \(isBig)")
//        labelTestLC.constant = isBig ? height : 20
        
//        label.sizeToFit()
        
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
//        self.view.layoutIfNeeded()
//        AutoLayoutManager.instance.toggleLayoutConstraintHeight(layoutConstraintHeight: labelLC, operation: true, andValueWhenTrueIs: height, andValueWhenFalseIs: 20)
//
//        label.sizeToFit()
//
//        AutoLayoutManager.instance.startToggleAnimation(view: self.view, withDuration: 0.2, completion: nil)
        
        
//        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        
        
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
