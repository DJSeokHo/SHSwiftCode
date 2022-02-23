//
//  AutoLayoutScrollWithoutStackViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/03/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

class AutoLayoutScrollWithoutStackViewController: UIViewController {

    @IBOutlet var viewContent: UIView!
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var viewTop: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewBottom: UIImageView!
    @IBOutlet var viewBottom: UIView!
    
    private var isBig = true
    
    private var heightConstrains: NSLayoutConstraint!
    private var viewTopHeightConstrains: NSLayoutConstraint!
    private var viewContentHeightConstrains: NSLayoutConstraint!
    private var viewBottomHeightConstrains: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initArchon()
        
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
    }
    @objc private func onButtonClick() {
        
        isBig = !isBig
        
        AutoLayoutManager.instance.toggleLayoutConstraintHeight(layoutConstraintHeight: heightConstrains, operation: isBig, andValueWhenTrueIs: 60, andValueWhenFalseIs: 20)

        AutoLayoutManager.instance.toggleLayoutConstraintHeight(layoutConstraintHeight: viewTopHeightConstrains, andWitchViewWillBeChange: viewTop, plusWillBeTrueAndMinusWillBeFalse: isBig, andValueIs: 40 + imageView.frame.height)
        
        AutoLayoutManager.instance.toggleLayoutConstraintHeight(layoutConstraintHeight: viewBottomHeightConstrains, andWitchViewWillBeChange: viewBottom, plusWillBeTrueAndMinusWillBeFalse: isBig, andValueIs: imageViewBottom.frame.height)
        
        AutoLayoutManager.instance.toggleLayoutConstraintHeight(layoutConstraintHeight: viewContentHeightConstrains, andWitchViewWillBeChange: viewContent, plusWillBeTrueAndMinusWillBeFalse: isBig, andValueIs: 40 + imageView.frame.height + imageViewBottom.frame.height)

        self.imageView.isHidden = self.isBig ? false : true
        self.imageViewBottom.isHidden = self.isBig ? false : true
        
        AutoLayoutManager.instance.startToggleAnimation(view: self.view, withDuration: 0.3, completion: nil)
        
    }

    private func initArchon() {
        
        heightConstrains = AutoLayoutManager.instance.createLayoutConstraintHeight(view: label)
        
      
        viewTopHeightConstrains = AutoLayoutManager.instance.createLayoutConstraintHeight(view: viewTop)
       
        viewContentHeightConstrains = AutoLayoutManager.instance.createLayoutConstraintHeight(view: viewContent)
        
        viewBottomHeightConstrains = AutoLayoutManager.instance.createLayoutConstraintHeight(view: viewBottom)
        
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
