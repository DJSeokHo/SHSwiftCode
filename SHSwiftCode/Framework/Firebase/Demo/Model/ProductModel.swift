//
//  ProductModel.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2021/05/13.
//  Copyright © 2021 SWein. All rights reserved.
//

import Foundation

class ProductModel {

    public static let CLOUD_DB_PATH = "PRODUCT_TABLE"

    public static let UUID_KEY = "UUID"
    public static let SHOP_MODEL_KEY = "SHOP_MODEL"
    public static let AREA_KEY = "AREA" // same as ShopModel's area
    public static let NAME_KEY = "NAME" // 제품 이름
    public static let IMAGE_URL_KEY = "IMAGE_URL" // 제품 이미지
    public static let IMAGE_FILE_CLOUD_PATH_KEY = "IMAGE_FILE_CLOUD_PATH" // 제품 이미지
    public static let INFO_KEY = "INFO" // 제품 정보
    public static let PRICE_KEY = "PRICE" // 제품 가격
    public static let SALE_TIME_KEY = "SALE_TIME" // 판매 시간
    public static let INVENTORY_KEY = "INVENTORY" // 제고 숫
    public static let PICKER_LIST_KEY = "PICKER_LIST" // 예약 방문자 숫
    public static let CREATE_DATE_KEY = "CREATE_DATE"
    public static let MODIFY_DATE_KEY = "MODIFY_DATE"
    public static let CREATE_BY_KEY = "CREATE_BY"
    public static let MODIFY_BY_KEY = "MODIFY_BY"
    
    public var documentId = ""

    public var uuId = ""
    public var shopModel: ShopModel? = nil
    public var area = ""
    public var name = ""
    public var imageUrl = ""
    public var imageFileCloudPath = ""
    public var info = ""
    public var price: Double = 0.0
    public var saleTime = ""
    public var inventory: Int = 0
    public var pickerList: [[String: Any]] = []
    public var createDate = ""
    public var modifyDate = ""
    public var createBy = ""
    public var modifyBy = ""
 
    func parsing(data: [String: Any]) {
        uuId = data[ProductModel.UUID_KEY] as? String ?? ""
        area = data[ProductModel.AREA_KEY] as? String ?? ""
        name = data[ProductModel.NAME_KEY] as? String ?? ""
        imageUrl = data[ProductModel.IMAGE_URL_KEY] as? String ?? ""
        imageFileCloudPath = data[ProductModel.IMAGE_FILE_CLOUD_PATH_KEY] as? String ?? ""
        info = data[ProductModel.INFO_KEY] as? String ?? ""
        price = data[ProductModel.PRICE_KEY] as? Double ?? 0.0
        saleTime = data[ProductModel.SALE_TIME_KEY] as? String ?? ""
        inventory = data[ProductModel.INVENTORY_KEY] as? Int ?? 0
        pickerList = data[ProductModel.PICKER_LIST_KEY] as? [[String: Any]] ?? [[String: Any]]()
        createDate = data[ProductModel.CREATE_DATE_KEY] as? String ?? ""
        modifyDate = data[ProductModel.MODIFY_DATE_KEY] as? String ?? ""
        createBy = data[ProductModel.CREATE_BY_KEY] as? String ?? ""
        modifyBy = data[ProductModel.MODIFY_BY_KEY] as? String ?? ""

        shopModel = ShopModel()
        guard let shopModelData = data[ProductModel.SHOP_MODEL_KEY] as? [String: Any] else {
            return
        }
        shopModel?.parsing(data: shopModelData)
    }
    
    func to() -> [String: Any] {

        var data = [String: Any]()

        data[ProductModel.UUID_KEY] = uuId
        data[ProductModel.SHOP_MODEL_KEY] = shopModel!.to()
        data[ProductModel.AREA_KEY] = area
        data[ProductModel.NAME_KEY] = name
        data[ProductModel.IMAGE_URL_KEY] = imageUrl
        data[ProductModel.IMAGE_FILE_CLOUD_PATH_KEY] = imageFileCloudPath
        data[ProductModel.INFO_KEY] = info
        data[ProductModel.PRICE_KEY] = price
        data[ProductModel.SALE_TIME_KEY] = saleTime
        data[ProductModel.INVENTORY_KEY] = inventory
        data[ProductModel.PICKER_LIST_KEY] = pickerList
        data[ProductModel.CREATE_DATE_KEY] = createDate
        data[ProductModel.MODIFY_DATE_KEY] = modifyDate
        data[ProductModel.CREATE_BY_KEY] = createBy
        data[ProductModel.MODIFY_BY_KEY] = modifyBy

        return data
    }

      
}
