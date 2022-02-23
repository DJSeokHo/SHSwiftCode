//
//  RestaurantDetailMapCell.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/18.
//  Copyright © 2022 SWein. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    public var onMapClick: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mapView.setOnClickListener(self, action: #selector(onMapClickListener))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func onMapClickListener() {
        onMapClick?()
    }

    func configure(locationString: String) {
        
        MapKitManager.instance.addMark(mapView: mapView, locationString: locationString, selected: false, regionMeters: 250)
        
    }
}
