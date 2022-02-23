////
////  CloudStorageManager.swift
////  SHSwiftCode
////
////  Created by Seok Ho on 2021/05/13.
////  Copyright © 2021 SWein. All rights reserved.
////
//
//import Foundation
//import FirebaseStorage
//
//class CloudStorageManager {
//    
//    public static let instance = CloudStorageManager()
//    private init() {}
//    
//    
//    public func uploadImage(uploadPath: String, data: Data, fileName: String,
//                            onSuccess: @escaping (_ imageUrl: String) -> Void,
//                            onFailure: @escaping (_ error: Error) -> Void) {
//        
//        let storageReference: StorageReference = Storage.storage(url: uploadPath).reference().child(fileName)
//        
////        let uploadTask = storageReference.putData(data, metadata: nil) { (metadata, error) in
//        storageReference.putData(data, metadata: nil) { (metadata, error) in
//            
//            if error != nil {
//                onFailure(error!)
//                return
//            }
//            
//            guard let metadata = metadata else {
//                return
//            }
//            
//            // Metadata contains file metadata such as size, content-type.
//            let size = metadata.size
//            ILog.debug(tag: #file, content: "size \(size)")
//            
//            // You can also access to download URL after upload.
//            storageReference.downloadURL { (url, error) in
//                
//                if error != nil {
//                    onFailure(error!)
//                    return
//                }
//                
//                guard let downloadURL = url else {
//                    // Uh-oh, an error occurred!
//                    return
//                }
//                
//                onSuccess(downloadURL.absoluteString)
//              
//            }
//            
//        }
//    }
//}
