////
////  CloudDBManager.swift
////  SHSwiftCode
////
////  Created by Seok Ho on 2021/05/13.
////  Copyright © 2021 SWein. All rights reserved.
////
//
//import Foundation
//import FirebaseFirestore
//
//class CloudDBManager {
// 
//    public static let instance = CloudDBManager()
//    private init() {}
//    
//    public func insert(collectionPath: String, data: [String: Any],
//                       onSuccess: @escaping (_ document: DocumentSnapshot) -> Void,
//                       onFailure: @escaping (_ error: Error) -> Void) {
//     
//        Firestore.firestore().collection(collectionPath).addDocument(data: data).addSnapshotListener { (document, error) in
//            
//            if (error != nil) {
//                onFailure(error!)
//                return
//            }
//
//            guard document != nil else {
//                return
//            }
//         
//            onSuccess(document!)
//        }
//    }
//    
//    public func delete(collectionPath: String, documentId: String,
//                       onSuccess: @escaping (_ documentId: String) -> Void,
//                       onFailure: @escaping (_ error: Error) -> Void) {
//        
//        Firestore.firestore().collection(collectionPath).document(documentId).delete(completion: { error in
//            if (error != nil) {
//                onFailure(error!)
//                return
//            }
//            
//            onSuccess(documentId)
//        })
//    }
//    
//    public func update(collectionPath: String, documentId: String, data: [String: Any],
//                       onSuccess: @escaping (_ documentId: String, _ data: [String: Any]) -> Void,
//                       onFailure: @escaping (_ error: Error) -> Void) {
//        
//        Firestore.firestore().collection(collectionPath).document(documentId).updateData(data, completion: { error in
//            
//            if (error != nil) {
//                onFailure(error!)
//                return
//            }
//            
//            onSuccess(documentId, data)
//            
//        })
//    }
//    
//    public func select(collectionPath: String, offset: DocumentSnapshot? = nil, limit: Int = 10,
//                      orderByCol: String? = nil,
//                      isDesc: Bool = true,
//                      conditionData: [String: Any]? = nil,
//                      onSuccess: @escaping(_ list: [[String: Any]], _ documentIdList: [String], _ lastVisibleItem: DocumentSnapshot) -> Void,
//                      onEmpty: @escaping () -> Void,
//                      onFailure: @escaping (_ error: Error) -> Void) {
//        
//        let collectionReference = Firestore.firestore().collection(collectionPath)
//        var query = collectionReference.limit(to: limit)
//        
//        if offset != nil {
//            query = query.start(afterDocument: offset!)
//        }
//        
//        if conditionData != nil {
//            
//            for (key, value) in conditionData! {
//                query = query.whereField(key, isEqualTo: value)
//            }
//            
//        }
//        
//        if orderByCol != nil {
//            query = query.order(by: orderByCol!, descending: isDesc)
//        }
//        
//        query.getDocuments { (querySnapshot, error) in
//            
//            if (error != nil) {
//                onFailure(error!)
//                return
//            }
//
//            if (querySnapshot == nil) {
//                onEmpty()
//                return
//            }
//
//            if querySnapshot!.isEmpty {
//                onEmpty()
//                return
//            }
//            
//            let documents = querySnapshot!.documents
//            
//            let lastVisibleItem = documents[querySnapshot!.count - 1]
//            
//            var list = [[String: Any]]()
//            
//            var documentIdList = [String]()
//            
//            for document in documents {
//                list.append(document.data())
//                documentIdList.append(document.documentID)
//            }
//            
//            onSuccess(list, documentIdList, lastVisibleItem)
////            ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot))")
////            ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot?.isEmpty))")
////            ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot?.documents.count))")
////            ILog.debug(tag: #file, content: "error \(String(describing: error))")
////
////            ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot?.documents[0].data()))")
////            let memberModel = MemberModel()
////            memberModel.documentId = querySnapshot!.documents[0].documentID
////            memberModel.parsing(data: querySnapshot!.documents[0].data())
////
////            ILog.debug(tag: #file, content: memberModel.toString())
//            
//        }
//    }
//}
