//
//  BasicUIViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/17.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicUIViewController: UIViewController {

    public static let TAG: String = "BasicUIViewController"
    
    @IBOutlet var buttonClose: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setListener()
    }
    
    private func setListener() {
       
        buttonClose.addTarget(self, action: #selector(onButtonCloseClick(_:)), for: UIControl.Event.touchUpInside)
        
    }

    @objc private func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addCustomUIViewWithoutNib()
    }
    
    /*
     在界面中间添加一个大小为100像素的黑色方块区域
     */
    private func addCustomUIViewWithoutNib() {
        let customUIView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        self.view.addSubview(customUIView)
        
        let fullScreen = DisplayUtility.getFullScreenSize()
        customUIView.center = CGPoint(x: fullScreen.width * 0.5, y: fullScreen.height * 0.5)
        customUIView.backgroundColor = UIColor.black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
