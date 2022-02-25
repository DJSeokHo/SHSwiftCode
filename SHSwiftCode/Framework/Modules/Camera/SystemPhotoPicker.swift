//
//  SystemPhotoPicker.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/25.
//

import Foundation
import UIKit

class SystemPhotoPicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public static let instance = SystemPhotoPicker()
    private override init() {}
    
    var onImageSelected: ((_ image: UIImage) -> UIViewController)?
    
    func camera(from: UIViewController, onImageSelected: @escaping (_ image: UIImage) -> UIViewController) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // MARK: 使用者也許不允許你存取照片庫， 較好的做法是你應該要使用 isSourceTypeAvailable 方法，來確認是否能取得媒體源（media source）.iOS 10 之後的版本，為了保護隱私，你必須清楚地說明你存取使用者照片庫或相機的理由。若是你沒有做說明的話，你應該會遇到錯誤。你必須在專案導覽器的Info.plist 檔上加上兩個鍵（ NSPhotoLibraryUsageDescription 與 NSCameraUsageDescription），並提供你的理由。info - add "Privacy - Photo Library Additions Usage Description" value is "your reason", add "Privacy - Camera Usage Description" value is "your reason"
        
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            
            imagePicker.delegate = self

            self.onImageSelected = onImageSelected
            
            from.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func photoLibrary(from: UIViewController, onImageSelected: @escaping (_ image: UIImage) -> UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            imagePicker.delegate = self

            self.onImageSelected = onImageSelected
            
            from.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            onImageSelected?(selectedImage).dismiss(animated: true, completion: nil)
            onImageSelected = nil
        }
    }
}
