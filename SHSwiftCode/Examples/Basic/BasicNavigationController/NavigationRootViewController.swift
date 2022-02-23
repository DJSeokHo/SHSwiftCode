//
//  NavigationRootViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/20.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class NavigationRootViewController: UIViewController, NavigationBarViewHolderDelegate {

    public static let TAG: String = "NavigationRootViewController"
    
    private var navigationBarViewHolder: NavigationBarViewHolder?
    
    @IBOutlet var buttonNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideSystemNavigationBar()
        setListener()
    }

    private func setListener() {
       
        buttonNext.addTarget(self, action: #selector(onButtonNextClick(_:)), for: UIControl.Event.touchUpInside)
        
    }

    @objc private func onButtonNextClick(_ sender: UIButton) {
        
        let firstViewController = FirstViewController()
        
        pushUIViewController(from: self, target: firstViewController, animated: true)
     
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initNavigationBar()
    }


    private func initNavigationBar() {

        if(navigationBarViewHolder == nil) {
            navigationBarViewHolder = NavigationBarViewHolder(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
            navigationBarViewHolder!.setTitle(title: NavigationRootViewController.TAG)
            navigationBarViewHolder!.setRightButtonImage(imageName: "icon_close.png")
            navigationBarViewHolder!.hideLeftButton()

            navigationBarViewHolder!.setDelegate(navigationBarViewHolderDelegate: self)

            self.view.addSubview(navigationBarViewHolder!)
        }
    }

    private func removeNavigationBar() {
        if(navigationBarViewHolder != nil) {
            navigationBarViewHolder?.removeFromSuperview()
            navigationBarViewHolder = nil;
        }
    }

    func onButtonLeftClicked() {
        
    }

    func onButtonRightClicked() {
        finish()
    }

    override func viewDidDisappear(_ animated: Bool) {
        removeNavigationBar()
        super.viewDidDisappear(animated)
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
