//
//  MemberSelfModel.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/05/13.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation

class MemberSelfModel {
    
    public static let instance = MemberSelfModel()
    private init() {}
    
    public var uuId = ""
    
    public var memberMode: MemberModel? = nil
    public var shopModel: ShopModel? = nil
    
    public var isLogin = false
    
    public func initWhenAppStart() {
        uuId = UserDefaultsUtility.get(key: "uuId")
    }
    
    public func parsingMemberModel(documentId: String = "", data: [String: Any]) {
        
        if documentId != "" {
            
            if memberMode == nil {
                memberMode = MemberModel()
            }
            
            memberMode!.documentId = documentId
        }
        
        memberMode!.parsing(data: data)
     
        UserDefaultsUtility.save(key: "uuId", andValue: memberMode!.uuId)
    }
    
    public func parsingShopModel(documentId: String = "", data: [String: Any]) {
        
        if documentId != "" {
            
            if shopModel == nil {
                shopModel = ShopModel()
            }
            
            shopModel?.documentId = documentId
        }
        
        shopModel?.parsing(data: data)
        
    }
    
    public func clear() {
        UserDefaultsUtility.save(key: "uuId", andValue: "")
        
        uuId = ""
        isLogin = false
        
        memberMode = nil
        shopModel = nil
    }
}
