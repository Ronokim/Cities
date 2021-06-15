//
//  CityMapView.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit
import MapKit

final class CityMapView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        self.backgroundColor = UIColor.darkGray
        
        let mapContainer: MKMapView = MKMapView.init(frame: CGRect.zero)
        mapContainer.tag = 1
        addSubview(mapContainer)
    }
}
