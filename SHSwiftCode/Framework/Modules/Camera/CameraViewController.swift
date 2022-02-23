//
//  CameraViewController.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 25/08/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class CameraViewController: UIViewController, NavigationBarViewHolderDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    private static let TAG = "CameraViewController"
    
    @IBOutlet var buttonCamera: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    public var width:CGFloat?
    private var navigationBarViewHolder: NavigationBarViewHolder?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        checkCameraPermission()
        checkAlbumPermission()
        
        setListener()
    }
    
    private func checkCameraPermission() {
        /*
         need add this in info.plist
         
         <key>NSCameraUsageDescription</key>
         <string>cameraDesciption</string>
         
         you can open info.plist in source code mode
        */
        if (AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .notDetermined) {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (statusFirst) in
                if statusFirst {
                    ILog.debug(tag: CameraViewController.TAG, content: "allow camera")
                }
                else {
                    ILog.debug(tag: CameraViewController.TAG, content: "not allow camera")
                    self.finish()
                }
            })
        }
        
    }
    
    private func checkAlbumPermission() {
        /*
         need add this in info.plist
         
         <key>NSPhotoLibraryUsageDescription</key>
         <string>photoLibraryDesciption</string>
         
         
         */
        
        if (PHPhotoLibrary.authorizationStatus() == .notDetermined) {
            PHPhotoLibrary.requestAuthorization({ (firstStatus) in
                let result = (firstStatus == .authorized)
                if result {
                    ILog.debug(tag: CameraViewController.TAG, content: "allow album")
                }
                else {
                    ILog.debug(tag: CameraViewController.TAG, content: "not allow album")
                    self.finish()
                }
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initNavigationBar()
    }
    
    private func initNavigationBar() {
        
        if(navigationBarViewHolder == nil) {
            navigationBarViewHolder = NavigationBarViewHolder(frame: CGRect(x: 0, y: 0, width: width!, height: 80))
            navigationBarViewHolder!.setTitle(title: "Camera")
            navigationBarViewHolder!.setRightButtonImage(imageName: "icon_close.png")
            navigationBarViewHolder!.hideLeftButton()
            
            navigationBarViewHolder!.setDelegate(navigationBarViewHolderDelegate: self)
            
            self.view.addSubview(navigationBarViewHolder!)
        }
    }
    
    private func removeNavigationBar() {
        if(navigationBarViewHolder != nil) {
            ILog.debug(tag: CameraViewController.TAG, content: "removeNavigationBar")
            navigationBarViewHolder?.removeFromSuperview()
            navigationBarViewHolder = nil;
        }
    }
    
    private func setListener() {
        self.buttonCamera.addTarget(self, action: #selector(self.onButtonCameraClicked(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func onButtonCameraClicked(_ sender: UIButton) {
        ILog.debug(tag: CameraViewController.TAG, content: "onButtonCameraClicked")
        toggleImageActionSheet()
    }

    func onButtonLeftClicked() {
        
    }
    
    func onButtonRightClicked() {
        finish()
    }
    
    private func toggleImageActionSheet() {
        
        let sexActionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        weak var weakSelf = self
        
        let cameraAlertAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) in
            
            weakSelf?.initCameraPicker()
            ILog.debug(tag: CameraViewController.TAG, content: "cameraAlertAction")
        })
        
        let albumAlertAction = UIAlertAction(title: "Album", style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) in
            
            ILog.debug(tag: CameraViewController.TAG, content: "albumAlertAction")
        })
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
            (alert: UIAlertAction!) in
                
            ILog.debug(tag: CameraViewController.TAG, content: "cancelAlertAction")
        })
        
        
        sexActionSheet.addAction(cameraAlertAction)
        sexActionSheet.addAction(albumAlertAction)
        sexActionSheet.addAction(cancelAlertAction)
        
        self.present(sexActionSheet, animated: true, completion: nil)
      
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeNavigationBar()
    }

    func initCameraPicker() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = .camera
         
            self.present(cameraPicker, animated: true, completion: nil)
        }
        else {
            
            ILog.debug(tag: CameraViewController.TAG, content: "Not support camera")
        
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
