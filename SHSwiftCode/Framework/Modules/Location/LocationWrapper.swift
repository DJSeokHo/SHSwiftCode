//
//  LocationWrapper.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2020/05/06.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation
import CoreLocation

/// info list : add NSLocationWhenInUseUsageDescription and descrption
class LocationWrapper: NSObject, CLLocationManagerDelegate {
    
    private static let instance = LocationWrapper()
    
    public var currentLocation: CLLocation!
    
    private var onLocateFinished: (() -> ())!
    
    private override init() {
        
    }
    
    public static func getInstance() -> LocationWrapper {
        return instance
    }
    
    private var locationManager: CLLocationManager!
    
    public func initLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        /*
         距離篩選器 用來設置移動多遠距離才觸發委任方法更新位置
         kCLLocationAccuracyBestForNavigation：精確度最高，適用於導航的定位。
         kCLLocationAccuracyBest：精確度高。
         kCLLocationAccuracyNearestTenMeters：精確度 10 公尺以內。
         kCLLocationAccuracyHundredMeters：精確度 100 公尺以內。
         kCLLocationAccuracyKilometer：精確度 1 公里以內。
         kCLLocationAccuracyThreeKilometers：精確度 3 公里以內。
         */
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        
        // 取得自身定位位置的精確度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 印出目前所在位置座標
        let currentLocation: CLLocation = locations[0] as CLLocation
        self.currentLocation = currentLocation
        onLocateFinished()
        ILog.debug(tag: #file, content: "[\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)]")
    }
    
    public func requestLocation(_ needPermission: () -> (), onLocateFinished: @escaping () -> ()) {
        
        self.onLocateFinished = onLocateFinished
        
//        if CLLocationManager.authorizationStatus() == .notDetermined {
//            // 取得定位服務授權
//            locationManager.requestWhenInUseAuthorization()
//
//            // 開始定位自身位置
//            locationManager.startUpdatingLocation()
//        }
//        // 使用者已經拒絕定位自身位置權限
//        else if CLLocationManager.authorizationStatus() == .denied {
//            // 提示可至[設定]中開啟權限
//            needPermission()
//        }
//        // 使用者已經同意定位自身位置權限
//        else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
//            // 開始定位自身位置
//            locationManager.startUpdatingLocation()
//        }
    }
    
    public func stopLocation() {
        locationManager.stopUpdatingLocation()
    }
}
