//
//  MemberModel.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/05/13.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation

class MemberModel {
    
    public static let CLOUD_DB_PATH = "MEMBER_TABLE"

    public static let UUID_KEY = "UUID"
    public static let LOGIN_SECRET_TOKEN_KEY = "LOGIN_SECRET_TOKEN"
    public static let MEMBER_ID_KEY = "MEMBER_ID"
    public static let EMAIL_KEY = "EMAIL"
    public static let PROVIDER_ID_KEY = "PROVIDER_ID"
    public static let PROVIDER_KEY = "PROVIDER"
    public static let PHONE_KEY = "PHONE"
    public static let NAME_KEY = "NAME"
    public static let BIRTH_KEY = "BIRTH"
    public static let GENDER_KEY = "GENDER"
    public static let NICKNAME_KEY = "NICKNAME"
    public static let PROFILE_IMAGE_URL_KEY = "PROFILE_IMAGE_URL"
    public static let PROFILE_IMAGE_FILE_CLOUD_PATH_KEY = "PROFILE_IMAGE_FILE_CLOUD_PATH"
    public static let PUSH_TOKEN_KEY = "PUSH_TOKEN_KEY"
    public static let CREATE_DATE_KEY = "CREATE_DATE"
    public static let MODIFY_DATE_KEY = "MODIFY_DATE"
    public static let CREATE_BY_KEY = "CREATE_BY"
    public static let MODIFY_BY_KEY = "MODIFY_BY"
    
    public var documentId = ""

    public var uuId = ""
    public var loginSecretToken = ""
    public var memberId = ""
    public var email = ""
    public var providerId = ""
    public var provider = ""
    public var phone = ""
    public var name = ""
    public var birth = ""
    public var gender: Int = -1 // 1: male, 0: female
    public var nickname = ""
    public var profileImageUrl = ""
    public var profileImageFileCloudPath = ""
    public var pushToken = ""
    public var createDate = ""
    public var modifyDate = ""
    public var createBy = ""
    public var modifyBy = ""
    
    public func parsing(data: [String: Any]) {
        uuId = data[MemberModel.UUID_KEY] as? String ?? ""
        loginSecretToken = data[MemberModel.LOGIN_SECRET_TOKEN_KEY] as? String ?? ""
        memberId = data[MemberModel.MEMBER_ID_KEY] as? String ?? ""
        email = data[MemberModel.EMAIL_KEY] as? String ?? ""
        providerId = data[MemberModel.PROVIDER_ID_KEY] as? String ?? ""
        provider = data[MemberModel.PROVIDER_KEY] as? String ?? ""
        phone = data[MemberModel.PHONE_KEY] as? String ?? ""
        name = data[MemberModel.NAME_KEY] as? String ?? ""
        birth = data[MemberModel.BIRTH_KEY] as? String ?? ""
        gender = data[MemberModel.GENDER_KEY] as? Int ?? -1
        nickname = data[MemberModel.NAME_KEY] as? String ?? ""
        profileImageUrl = data[MemberModel.PROFILE_IMAGE_URL_KEY] as? String ?? ""
        profileImageFileCloudPath = data[MemberModel.PROFILE_IMAGE_FILE_CLOUD_PATH_KEY] as? String ?? ""
        pushToken = data[MemberModel.PUSH_TOKEN_KEY] as? String ?? ""
        createDate = data[MemberModel.CREATE_DATE_KEY] as? String ?? ""
        modifyDate = data[MemberModel.MODIFY_DATE_KEY] as? String ?? ""
        createBy = data[MemberModel.CREATE_BY_KEY] as? String ?? ""
        modifyBy = data[MemberModel.MODIFY_BY_KEY] as? String ?? ""
    }
    
    public func to() -> [String: Any] {
        var data = [String: Any]()
        
        data[MemberModel.UUID_KEY] = uuId
        data[MemberModel.LOGIN_SECRET_TOKEN_KEY] = loginSecretToken
        data[MemberModel.MEMBER_ID_KEY] = memberId
        data[MemberModel.EMAIL_KEY] = email
        data[MemberModel.PROVIDER_ID_KEY] = providerId
        data[MemberModel.PROVIDER_KEY] = provider
        data[MemberModel.PHONE_KEY] = phone
        data[MemberModel.NAME_KEY] = name
        data[MemberModel.BIRTH_KEY] = birth
        data[MemberModel.GENDER_KEY] = gender
        data[MemberModel.NICKNAME_KEY] = nickname
        data[MemberModel.PROFILE_IMAGE_URL_KEY] = profileImageUrl
        data[MemberModel.PROFILE_IMAGE_FILE_CLOUD_PATH_KEY] = profileImageFileCloudPath
        data[MemberModel.PUSH_TOKEN_KEY] = pushToken
        data[MemberModel.CREATE_DATE_KEY] = createDate
        data[MemberModel.MODIFY_DATE_KEY] = modifyDate
        data[MemberModel.CREATE_BY_KEY] = createBy
        data[MemberModel.MODIFY_BY_KEY] = modifyBy
        
        return data
    }
    
    func toString() -> String {
        return "documentId:\(documentId) uuId:\(uuId) loginSecretToken:\(loginSecretToken) memberId:\(memberId) email:\(email) providerId:\(providerId) provider:\(provider) phone:\(phone) name:\(name) birth:\(birth) gender:\(gender) nickname:\(nickname) profileImageUrl:\(profileImageUrl) profileImageFileCloudPath:\(profileImageFileCloudPath) pushToken:\(pushToken) createDate:\(createDate) modifyDate:\(modifyDate) createBy:\(createBy) modifyBy:\(modifyBy)"
    }
}
