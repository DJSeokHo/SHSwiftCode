//
//  ShopModel.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/05/13.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation

class ShopModel {

    public static let AREA_1 = "분당구"
    public static let AREA_2 = "수정구"
    public static let AREA_3 = "중원구"

    public static let CLOUD_DB_PATH = "SHOP_TABLE"

    public static let UUID_KEY = "UUID"
    public static let OWNER_UUID_KEY = "OWNER_UUID"
    public static let BUSINESS_NUMBER_KEY = "BUSINESS_NUMBER"
    public static let NAME_KEY = "NAME"
    public static let SHOP_NAME_KEY = "SHOP_NAME"
    public static let BUSINESS_NAME_KEY = "BUSINESS_NAME"
    public static let CONTACT_KEY = "CONTACT"
    public static let AREA_KEY = "AREA"
    public static let DETAIL_ADDRESS_KEY = "DETAIL_ADDRESS"
    public static let LAT_KEY = "LAT"
    public static let LNG_KEY = "LNG"
    public static let INFO_KEY = "INFO"
    public static let BUSINESS_HOUR_KEY = "BUSINESS_HOUR"
    public static let SHOP_IMAGE_URL_KEY = "SHOP_IMAGE_URL"
    public static let SHOP_IMAGE_FILE_CLOUD_PATH_KEY = "SHOP_IMAGE_FILE_CLOUD_PATH"
    public static let BUSINESS_IMAGE_URL_KEY = "BUSINESS_IMAGE_URL"
    public static let BUSINESS_IMAGE_FILE_CLOUD_PATH_KEY = "BUSINESS_IMAGE_FILE_CLOUD_PATH"
    public static let READY_FOR_SALE_KEY = "READY_FOR_SALE"
    public static let IS_OPEN_KEY = "IS_OPEN"
    public static let CREATE_DATE_KEY = "CREATE_DATE"
    public static let MODIFY_DATE_KEY = "MODIFY_DATE"
    public static let CREATE_BY_KEY = "CREATE_BY"
    public static let MODIFY_BY_KEY = "MODIFY_BY"

    public var documentId = ""

    public var uuId = ""
    public var ownerUuId = ""
    public var businessNumber = ""
    public var name = "" // 가게주인 이름
    public var shopName = "" // 가게 이름
    public var businessName = "" // 상호명
    public var contact = ""
    public var area = ""
    public var detailAddress = ""
    public var lat = 0.0
    public var lng = 0.0
    public var info = ""
    public var businessHour = ""
    public var shopImageUrl = "" // 가게이미지
    public var shopImageFileCloudPath = ""
    public var businessImageUrl = "" // 사업자 등록증 이미지
    public var businessImageFileCloudPath = ""
    public var readyForSale: Int = 0 // 0: 심사중, 1: 정상, -1: 임시 금지
    public var isOpen: Int = 0
    public var createDate = ""
    public var modifyDate = ""
    public var createBy = ""
    public var modifyBy = ""
    
    public func parsing(data: [String: Any]) {
        uuId = data[ShopModel.UUID_KEY] as? String ?? ""
        ownerUuId = data[ShopModel.OWNER_UUID_KEY] as? String ?? ""
        businessNumber = data[ShopModel.BUSINESS_HOUR_KEY] as? String ?? ""
        name = data[ShopModel.NAME_KEY] as? String ?? ""
        shopName = data[ShopModel.SHOP_NAME_KEY] as? String ?? ""
        businessName = data[ShopModel.BUSINESS_NAME_KEY] as? String ?? ""
        contact = data[ShopModel.CONTACT_KEY] as? String ?? ""
        area = data[ShopModel.AREA_KEY] as? String ?? ""
        detailAddress = data[ShopModel.DETAIL_ADDRESS_KEY] as? String ?? ""
        lat = data[ShopModel.LAT_KEY] as? Double ?? 0
        lng = data[ShopModel.LNG_KEY] as? Double ?? 0
        info = data[ShopModel.INFO_KEY] as? String ?? ""
        businessNumber = data[ShopModel.BUSINESS_NUMBER_KEY] as? String ?? ""
        shopImageUrl = data[ShopModel.SHOP_IMAGE_URL_KEY] as? String ?? ""
        shopImageFileCloudPath = data[ShopModel.SHOP_IMAGE_FILE_CLOUD_PATH_KEY] as? String ?? ""
        businessImageUrl = data[ShopModel.BUSINESS_IMAGE_URL_KEY] as? String ?? ""
        businessImageFileCloudPath = data[ShopModel.BUSINESS_IMAGE_FILE_CLOUD_PATH_KEY] as? String ?? ""
        readyForSale = data[ShopModel.READY_FOR_SALE_KEY] as? Int  ?? 0
        isOpen = data[ShopModel.IS_OPEN_KEY] as? Int ?? 0
        createDate = data[ShopModel.CREATE_DATE_KEY] as? String ?? ""
        modifyDate = data[ShopModel.MODIFY_DATE_KEY] as? String ?? ""
        createBy = data[ShopModel.CREATE_BY_KEY] as? String ?? ""
        modifyBy = data[ShopModel.MODIFY_BY_KEY] as? String ?? ""
    }
    
    public func to() -> [String: Any] {

        var data = [String: Any]()

        data[ShopModel.UUID_KEY] = uuId
        data[ShopModel.OWNER_UUID_KEY] = ownerUuId
        data[ShopModel.BUSINESS_NUMBER_KEY] = businessNumber
        data[ShopModel.NAME_KEY] = name
        data[ShopModel.SHOP_NAME_KEY] = shopName
        data[ShopModel.BUSINESS_NAME_KEY] = businessName
        data[ShopModel.CONTACT_KEY] = contact
        data[ShopModel.AREA_KEY] = area
        data[ShopModel.DETAIL_ADDRESS_KEY] = detailAddress
        data[ShopModel.LAT_KEY] = lat
        data[ShopModel.LNG_KEY] = lng
        data[ShopModel.INFO_KEY] = info
        data[ShopModel.BUSINESS_HOUR_KEY] = businessHour
        data[ShopModel.SHOP_IMAGE_URL_KEY] = shopImageUrl
        data[ShopModel.SHOP_IMAGE_FILE_CLOUD_PATH_KEY] = shopImageFileCloudPath
        data[ShopModel.BUSINESS_IMAGE_URL_KEY] = businessImageUrl
        data[ShopModel.BUSINESS_IMAGE_FILE_CLOUD_PATH_KEY] = businessImageFileCloudPath
        data[ShopModel.READY_FOR_SALE_KEY] = readyForSale
        data[ShopModel.IS_OPEN_KEY] = isOpen
        data[ShopModel.CREATE_DATE_KEY] = createDate
        data[ShopModel.MODIFY_DATE_KEY] = modifyDate
        data[ShopModel.CREATE_BY_KEY] = createBy
        data[ShopModel.MODIFY_BY_KEY] = modifyBy

        return data
    }

}
