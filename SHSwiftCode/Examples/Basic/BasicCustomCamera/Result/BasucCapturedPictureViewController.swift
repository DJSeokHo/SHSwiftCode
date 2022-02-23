//
//  BasucCapturedPictureViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/05/04.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit
import Photos

class BasucCapturedPictureViewController: UIViewController {

    public var capturedImage: UIImage?
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    private var orientation: UIImage.Orientation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideSystemNavigationBar()
        
        if capturedImage == nil {
            popUIViewController(from: self, animated: true)
        }
        
        imageView.image = capturedImage!
        
        hideProgress()
        
        
        StorageUtility.deleteFile(pathName: StorageUtility.getLibraryDirectory(), folderName: "Test", fileName: "test_image.png")
        
        ILog.debug(tag: #file, content: StorageUtility.exists(path: NSString(string: NSString(string: StorageUtility.getLibraryDirectory()).appendingPathComponent("Test")).appendingPathComponent("test_image.png")))
        
        StorageUtility.deleteFolder(pathName: StorageUtility.getLibraryDirectory(), folderName: "Test")
        ILog.debug(tag: #file, content: StorageUtility.exists(path: NSString(string: StorageUtility.getLibraryDirectory()).appendingPathComponent("Test")))
    }


    @IBAction func onButtonBackClick(_ sender: Any) {
        popUIViewController(from: self, animated: true)
    }
    
    @IBAction func onButtonSaveClick(_ sender: Any) {
        
        saveToAlumb()
    }
    
    @IBAction func onButtonSaveToFolderClick(_ sender: Any) {
        
        showProgress()
        
        ThreadUtility.startThread {
            
            // need image info
            let imageInfo = self.saveToFolder()
            ILog.debug(tag: #file, content: "\(imageInfo.0) \(imageInfo.1) \(imageInfo.2)")
            self.orientation = imageInfo.2
            
            ThreadUtility.startUIThread(runnable: {
                
                self.hideProgress()
                ILog.debug(tag: #file, content: "success")
            }, afterSeconds: 0)
        }
    }
    
    @IBAction func onButtonLoadFromFolderClick(_ sender: Any) {
        
        showProgress()
        ThreadUtility.startThread {
            
            let tempImage = self.loadFromFolder()
            
            let newImage = UIImage(cgImage: tempImage.cgImage!, scale: tempImage.scale, orientation: self.orientation)
            
            ILog.debug(tag: #file, content: newImage.imageOrientation.rawValue)
            
            ThreadUtility.startUIThread(runnable: {
                self.imageView.image = newImage
                self.hideProgress()
                ILog.debug(tag: #file, content: "success")
            }, afterSeconds: 0)
        }
    }
    
    private func loadFromFolder() -> UIImage {
        
        return StorageUtility.loadImageFile(
            pathName: StorageUtility.getLibraryDirectory(),
            folderName: "Test",
            imageName: "test_image.png",
            orientation: orientation)
        
    }
   
    private func saveToFolder() -> (String, String, UIImage.Orientation) {
        
        return StorageUtility.saveImageFile(
            pathName: StorageUtility.getLibraryDirectory(),
            folderName: "Test",
            imageName: "test_image.png",
            image: capturedImage!)
      
    }
    
    private func saveToAlumb() {
        
        // should disable save button at here!!
        
        showProgress()
        
        ThreadUtility.startThread {
            
            UIImageWriteToSavedPhotosAlbum(self.capturedImage!, self, #selector(self.saveImage(image:didFinishSavingWithError:contextInfo:)), nil)
            
        }
    }
    
    @objc private func saveImage(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
           
        if error == nil {
         
            ILog.debug(tag: #file, content: "save success")
            
            ThreadUtility.startUIThread(runnable: {
                self.hideProgress()
                
                self.popUIViewController(from: self, animated: true)
                
            }, afterSeconds: 0)
        }
    }
    
    private func showProgress() {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    private func hideProgress() {
        indicator.stopAnimating()
        indicator.isHidden = true
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
