//
//  SIAMapViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/18.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit
import MapKit

class SIAMapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    public var model = RestaurantModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ILog.debug(tag: #file, content: model.location)
        
        MapKitManager.instance.addMark(mapView: mapView, locationString: model.location, title: model.name, subTitle: model.type)
        
        mapView.delegate = self
        
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
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

extension SIAMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        /*
         这里的地图标记也是重复使用的，委托的方式可以获得已经被添加的标记
         我们可以修改标记的外观，而不是去重新创建一个标记
         */
        
        return MapKitManager.instance.setCustomMark(
            mapView: mapView, annotation: annotation, identifier: "MyMarker",
            text: "😋", tint: UIColor.orange
        )
    }
    
}
