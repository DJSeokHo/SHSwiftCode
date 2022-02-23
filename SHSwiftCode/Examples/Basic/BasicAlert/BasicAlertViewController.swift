//
//  BasicAlertViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2019/10/23.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit

class BasicAlertViewController: UIViewController {

    private static let TAG: String = "BasicAlertViewController"
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    @IBOutlet var buttonSimpleAlert: UIButton!
    @IBOutlet var buttonTwoButtonAlert: UIButton!
    @IBOutlet var buttonTwoButtonDeleteAlert: UIButton!
    @IBOutlet var buttonTwoButtonInputAlert: UIButton!
    @IBOutlet var buttonBottomAlert: UIButton!
    
    private var fullScreenSize: CGSize?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullScreenSize = DisplayUtility.getFullScreenSize()
        
        setListener()
    }
    
    private func setListener() {
        
        buttonSimpleAlert.addTarget(self, action: #selector(self.createSimpleAlert), for: UIControl.Event.touchUpInside)
        
        buttonTwoButtonAlert.addTarget(self, action: #selector(self.createTwoButtonAlert), for: UIControl.Event.touchUpInside)
        
        buttonTwoButtonDeleteAlert.addTarget(self, action: #selector(self.createTwoButtonDeleteAlert), for: UIControl.Event.touchUpInside)
        
        buttonTwoButtonInputAlert.addTarget(self, action: #selector(self.createTwoButtonInputAlert), for: UIControl.Event.touchUpInside)
        
        buttonBottomAlert.addTarget(self, action: #selector(self.createBottomAlert), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc private func createSimpleAlert(_ send: UIButton) {
        
        ILog.debug(tag: BasicAlertViewController.TAG, content: "createSimpleAlert")
        
        let alertController = UIAlertController(
            title: "alert",
            message: "simple alert",
            preferredStyle: UIAlertController.Style.alert)


        let confirmAction = UIAlertAction(
            title: "confirm",
            style: UIAlertAction.Style.default,
            handler: {
                (alertAction: UIAlertAction) -> Void in
                    print("simple alert confirm")
        })

        alertController.addAction(confirmAction)

        self.present(alertController, animated: true)
    }
    
    @objc private func createTwoButtonAlert() {
        
        ILog.debug(tag: BasicAlertViewController.TAG, content: "createTwoButtonAlert")
        
        let alertController = UIAlertController(
            title: "alert",
            message: "two button alert",
            preferredStyle: UIAlertController.Style.alert)


        let confirmAction = UIAlertAction(
            title: "confirm",
            style: UIAlertAction.Style.default,
            handler: {
                (alertAction: UIAlertAction) -> Void in
                    print("two button alert confirm")
        })
        
        let cancelAction = UIAlertAction(
            title: "cancel",
            style: UIAlertAction.Style.cancel,
            handler: {
                (alertAction: UIAlertAction) -> Void in
                    print("two button alert cancel")
        })

        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)

        self.present(alertController, animated: true)
        
    }
    
    @objc private func createTwoButtonDeleteAlert() {
        
        ILog.debug(tag: BasicAlertViewController.TAG, content: "createTwoButtonDeleteAlert")
               
        let alertController = UIAlertController(
           title: "alert",
           message: "two button delete alert",
           preferredStyle: UIAlertController.Style.alert)


        let confirmAction = UIAlertAction(
           title: "confirm",
           style: UIAlertAction.Style.default,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                   print("two button delete alert confirm")
        })

        let deleteAction = UIAlertAction(
           title: "delete",
           style: UIAlertAction.Style.destructive,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                   print("two button delete alert delete")
        })

        alertController.addAction(deleteAction)
        alertController.addAction(confirmAction)

        self.present(alertController, animated: true)
    }
    
    @objc private func createTwoButtonInputAlert() {
     
        ILog.debug(tag: BasicAlertViewController.TAG, content: "createTwoButtonInputAlert")
               
        let alertController = UIAlertController(
           title: "alert",
           message: "two button input alert",
           preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField(configurationHandler: {
            (textField: UITextField) -> Void in
                textField.placeholder = "id"
        })
        
        alertController.addTextField(configurationHandler: {
            (textField: UITextField) -> Void in
                textField.placeholder = "password"
                textField.isSecureTextEntry = true
        })
        
        let confirmAction = UIAlertAction(
           title: "confirm",
           style: UIAlertAction.Style.default,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                    print("two button input alert confirm")
                    let id = (alertController.textFields?.first)! as UITextField
                    let password = (alertController.textFields?.last)! as UITextField

            print("id is：\(id.text ?? "")")
                    print("password is：\(password.text ?? "")")
        })

        let cancelAction = UIAlertAction(
           title: "cancel",
           style: UIAlertAction.Style.cancel,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                   print("two button input alert cancel")
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)

        self.present(alertController, animated: true)
    }
    
    @objc private func createBottomAlert() {
        
        ILog.debug(tag: BasicAlertViewController.TAG, content: "createBottomAlert")
        
        let alertController = UIAlertController(
        title: "alert",
        message: "two button input alert",
        preferredStyle: UIAlertController.Style.actionSheet)
        
        let cancelAction = UIAlertAction(
           title: "cancel",
           style: UIAlertAction.Style.cancel,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                   print("two button input alert cancel")
        })
        
        alertController.addAction(cancelAction)
        
        let hahaAction = UIAlertAction(
        title: "haha",
           style: UIAlertAction.Style.default,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                   print("bottom button alert haha")
        })
        
        let heheAction = UIAlertAction(
        title: "hehe",
           style: UIAlertAction.Style.default,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                   print("bottom button alert hehe")
        })
        
        let deleteAction = UIAlertAction(
           title: "delete",
           style: UIAlertAction.Style.destructive,
           handler: {
               (alertAction: UIAlertAction) -> Void in
                   print("two button delete alert delete")
        })
        
        alertController.addAction(hahaAction)
        alertController.addAction(heheAction)
        alertController.addAction(deleteAction)
        
        self.present(alertController, animated: true)
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
