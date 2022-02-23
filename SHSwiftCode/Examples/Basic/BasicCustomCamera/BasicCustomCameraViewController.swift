//
//  BasicCustomCameraViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/05/04.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit
import AVFoundation

class BasicCustomCameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    let session = AVCaptureSession()
    var camera: AVCaptureDevice?
    var cameraPreviewPlayer: AVCaptureVideoPreviewLayer?
    var cameraCaptureOhotoOutput: AVCapturePhotoOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideSystemNavigationBar()
        
        initalizeCaptureSession()
        
    }

    func initalizeCaptureSession() {
        
        // 相片质量
        session.sessionPreset = AVCaptureSession.Preset.high
        camera = AVCaptureDevice.default(for: AVMediaType.video)
        
        // guard 不满足条件时，执行 else 后括号里部分的语句
        guard let cameraCaptureInput = try? AVCaptureDeviceInput(device: camera!) else {
            return
        }
      
        cameraCaptureOhotoOutput = AVCapturePhotoOutput()

        session.addInput(cameraCaptureInput)
        session.addOutput(cameraCaptureOhotoOutput!)
        
        cameraPreviewPlayer = AVCaptureVideoPreviewLayer(session: session)
        cameraPreviewPlayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewPlayer?.frame = CGRect(x: 0, y: 0 , width: view.frame.size.width, height: view.frame.size.height)
        cameraPreviewPlayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        // addsubview时都是在最上面面添加
        // insertSubView可以控制将view添加到指定的层
       
        // addSublayer时都是在最上面面添加
//        view.layer.addSublayer(cameraPreviewPlayer!)
        // insertSublayer可以控制将view添加到指定的层
        view.layer.insertSublayer(cameraPreviewPlayer!, at: 0)
        
        session.startRunning()
    }
    
    @IBAction func onButtonTakePictureClick(_ sender: Any) {
        takePicture()
    }
    
    func takePicture() {
        
        let settings = AVCapturePhotoSettings()
        settings.flashMode = AVCaptureDevice.FlashMode.auto
        
        cameraCaptureOhotoOutput?.capturePhoto(with: settings, delegate: self)
    }
 
    func displayCatpurePhoto(image: UIImage) {
        
        let basucCapturedPictureViewController = BasucCapturedPictureViewController()
        basucCapturedPictureViewController.capturedImage = image
     
        pushUIViewController(from: self, target: basucCapturedPictureViewController, animated: true)
    }
    
    // from  iOS 11
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        if let imageData = photo.fileDataRepresentation() {
            
            if let finalImage = UIImage(data: imageData) {
                      
                      displayCatpurePhoto(image: finalImage)
                      
                  }
            
        }
        
    }
    
    // before iOS 11
//    func photoOutput(_ captureOutput: AVCapturePhotoOutput,
//                     didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?,
//                     previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?,
//        resolvedSettings: AVCaptureResolvedPhotoSettings,
//        bracketSettings: AVCaptureBracketedStillImageSettings?,
//        error: Error?)
//    {
//
//        if let unwrapperError = error {
//            ILog.debug(tag: #file, content: unwrapperError.localizedDescription)
//        }
//        else {
//
//            if let sampleBuffer = photoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) {
//
//                if let finalImage = UIImage(data: dataImage) {
//
//                    displayCatpurePhoto(image: finalImage)
//
//                }
//            }
//
//        }
//    }
    
    @IBAction func onButtonCloseClick(_ sender: Any) {
        finish()
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
