//
//  FirebaseDemoViewController.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/05/10.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit
//import FirebaseFirestore

class FirebaseDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        ThreadUtil.startThread {
//
//            Firestore.firestore().collection("MEMBER_TABLE").limit(to: 1).getDocuments { (querySnapshot, error) in
//
//                if (error != nil) {
//
//                    return
//                }
//
//                if (querySnapshot == nil) {
//                    return
//                }
//
//                ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot))")
//                ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot?.isEmpty))")
//                ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot?.documents.count))")
//                ILog.debug(tag: #file, content: "error \(String(describing: error))")
//
//
//                ILog.debug(tag: #file, content: "document \(String(describing: querySnapshot?.documents[0].data()))")
//                let memberModel = MemberModel()
//                memberModel.documentId = querySnapshot!.documents[0].documentID
//                memberModel.parsing(data: querySnapshot!.documents[0].data())
//
//                ILog.debug(tag: #file, content: memberModel.toString())
//            }
//        }
        
//        ThreadUtil.startThread {
//            
//            let memberModel = MemberModel()
//            
//            let uuid = UUIDUtil.getUUID()
//            memberModel.uuId = uuid
//            memberModel.loginSecretToken = "iossecrettoken"
//            memberModel.memberId = ""
//            memberModel.email = ""
//            memberModel.providerId = "lashfkjbf.osahdwqhdhwq121j32i1oc3"
//            memberModel.provider = "APPLE"
//            memberModel.phone = ""
//            memberModel.name = ""
//            memberModel.birth = ""
//            memberModel.gender = -1 // 1: male, 0: female
//            memberModel.nickname = "iOS nick name"
//            memberModel.profileImageUrl = ""
//            memberModel.profileImageFileCloudPath = ""
//            memberModel.pushToken = "nnnnnnnnn"
//            
//            let date = DateUtil.getCurrentDateTimeStringWithStandardSQLiteDateTimeFromatter()
//            memberModel.createDate = date
//            memberModel.modifyDate = date
//            memberModel.createBy = uuid
//            memberModel.modifyBy = uuid
//        
//            
//            Firestore.firestore().collection("MEMBER_TABLE").addDocument(data: memberModel.to()).addSnapshotListener { (document, error) in
//                if (error != nil) {
//
//                    return
//                }
//
//                if (document == nil) {
//                    return
//                }
//
//                ILog.debug(tag: #file, content: "document \(String(describing: document))")
//                ILog.debug(tag: #file, content: "error \(String(describing: error))")
//
//                ILog.debug(tag: #file, content: "document \(String(describing: document?.documentID))")
//                ILog.debug(tag: #file, content: "document \(String(describing: document?.data()))")
//
//                memberModel.documentId = document!.documentID
//                memberModel.parsing(data: document!.data()!)
//                ILog.debug(tag: #file, content: memberModel.toString())
//            }
//            
//        }
        
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
