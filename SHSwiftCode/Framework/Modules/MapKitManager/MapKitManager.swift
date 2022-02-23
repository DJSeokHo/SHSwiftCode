//
//  MapKitManager.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/18.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation
import MapKit

class MapKitManager {
    
    public static let instance = MapKitManager()
    private init() {}
    
    public func addMark(
        mapView: MKMapView,
        locationString: String,
        title: String = "",
        subTitle: String = "",
        selected: Bool = true,
        regionMeters: Double = 0
    ) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(locationString, completionHandler: { placemarks, error in
            if let error = error {
                ILog.debug(tag: #file, content: error.localizedDescription)
                return
            }

            if let placemarks = placemarks {
                
                let placemark = placemarks[0]

                
                let annotation = MKPointAnnotation()
                annotation.title = title
                annotation.subtitle = subTitle

                if let location = placemark.location {
                    annotation.coordinate = location.coordinate

                    // 顯示標記
                    mapView.showAnnotations([annotation], animated: true)
                    
                    if selected {
                        mapView.selectAnnotation(annotation, animated: true)
                    }
                    
                    if regionMeters != 0 {
                        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: regionMeters, longitudinalMeters: regionMeters)
                        mapView.setRegion(region, animated: false)
                    }
                 
                }
            }
        })
        
    }
    
    public func setCustomMark(
        mapView: MKMapView, annotation: MKAnnotation, identifier: String,
        image: UIImage? = nil, text: String = "", tint: UIColor = UIColor.red
    ) -> MKAnnotationView? {
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }

        // Reuse the annotation if possible
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }

        // MARK: image 和 文字不能同时生效
        
        // MARK: glyphImage - 顯示在氣球標記的圖片。
        if image != nil {
            annotationView?.glyphImage = image
        }
       
        // MARK: glyphText - 显示的文字
        if text != "" {
            annotationView?.glyphText = text
        }
       
        // MARK: markerTintColor - 氣球標記的背景顏色
        annotationView?.markerTintColor = tint

        return annotationView
    }
    
}
