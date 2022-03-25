//
//  HttpWrapper.swift
//
//  Created by Seok Ho on 2020/12/30.
//

import Foundation
import Alamofire


class HttpFileModel {
    
    var data: Data
    var fileName: String
    var mimeType: String
    
    init(data: Data, fileName: String, mimeType: String) {
        self.data = data
        self.fileName = fileName
        self.mimeType = mimeType
    }
}

class HttpWrapper {
    
    public static func requestGet(
        withUrl url: String,
        withHeader header: HTTPHeaders? = nil,
        onSuccess success: @escaping (_ data: Data?) -> Void,
        onFail fail: @escaping (_ error: AFError?) -> Void
    ) {
        AF.request(url, method: .get, headers: header).validate()
          
            .responseData { response in

                ILog.debug(tag: #file, content: "\(response)")
                
                switch response.result {
                    case .success(_):
                        ILog.debug(tag: #file, content: "\(url) success")
                        success(response.data)
                        break
                    case .failure(_):
                        ILog.debug(tag: #file, content: "\(url) failure")
                        fail(response.error)
                        break
                }
            }
    }
    
   
    public static func requestPost(
        withUrl url: String,
        withHeader header: HTTPHeaders? = nil,
        withFormData formData: [String: String]? = nil,
        withFiles fileList: [HttpFileModel]? = nil,
        onSuccess success: @escaping (_ data: Data?) -> Void,
        onFail fail: @escaping (_ error: AFError?) -> Void
    ) {
        
        if fileList != nil {
            
            AF.upload(multipartFormData: {
                multipartFormData in
                
                for i in 0..<fileList!.count {
                    multipartFormData.append(fileList![i].data, withName: "files", fileName: fileList![i].fileName, mimeType: fileList![i].mimeType)
                }
                
                if formData != nil {
                    for (key, value) in formData! {
                        multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    }
                }
               
                
            }, to: url, method: .post, headers: header).validate().responseData {
                (response) in

                switch response.result {
                    case .success(_):
                        ILog.debug(tag: #file, content: "\(url) success")
                        success(response.data)
                        break
                    case .failure(_):
                        ILog.debug(tag: #file, content: "\(url) failure")
                        fail(response.error)
                        break
                }
            }
            
        }
        else {
            
            AF.request(url, method: .post, parameters: formData, headers: header).validate()
                .responseData {
                    (response) in

                    switch response.result {
                        case .success(_):
                            ILog.debug(tag: #file, content: "\(url) success")
                            success(response.data)
                            break
                        case .failure(_):
                            ILog.debug(tag: #file, content: "\(url) failure")
                            fail(response.error)
                            break
                    }
                }
        }
       
    }
    
    public static func requestPut(
        withUrl url: String,
        withHeader header: HTTPHeaders? = nil,
        withFormData formData: [String: String]? = nil,
        withFiles fileList: [HttpFileModel]? = nil,
        onSuccess success: @escaping (_ data: Data?) -> Void,
        onFail fail: @escaping (_ error: AFError?) -> Void
    ) {
        
        if fileList != nil {
            
            AF.upload(multipartFormData: {
                multipartFormData in
                
                for i in 0..<fileList!.count {
                    multipartFormData.append(fileList![i].data, withName: "files", fileName: fileList![i].fileName, mimeType: fileList![i].mimeType)
                }
                
                if formData != nil {
                    
                    for (key, value) in formData! {
                        multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    }
            
                }
               
            }, to: url, method: .put, headers: header).validate().responseData {
                (response) in

                switch response.result {
                    case .success(_):
                        ILog.debug(tag: #file, content: "\(url) success")
                        success(response.data)
                        break
                    case .failure(_):
                        ILog.debug(tag: #file, content: "\(url) failure")
                        fail(response.error)
                        break
                }
            }
            
        }
        else {
            
            AF.request(url, method: .put, parameters: formData, headers: header).validate()
                .responseData {
                    (response) in
                   
                    switch response.result {
                        case .success(_):
                            ILog.debug(tag: #file, content: "\(url) success")
                            success(response.data)
                            break
                        case .failure(_):
                            ILog.debug(tag: #file, content: "\(url) failure")
                            fail(response.error)
                            break
                    }
                }
            
        }
        
    }
       
    public static func requestDelete(
        withUrl url: String,
        withHeader header: HTTPHeaders? = nil,
        formData: [String: String]? = nil,
        onSuccess success: @escaping (_ data: Data?) -> Void,
        onFail fail: @escaping (_ error: AFError?) -> Void
    ) {
        
        AF.request(url, method: .delete, parameters: formData, headers: header).validate()
            .responseData {
                (response) in

                switch response.result {
                    case .success(_):
                        ILog.debug(tag: #file, content: "\(url) success")
                        success(response.data)
                        break
                    case .failure(_):
                        ILog.debug(tag: #file, content: "\(url) failure")
                        fail(response.error)
                        break
                }
            }
    }
}
