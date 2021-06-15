//
//  CityMapViewController.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit
import MapKit

final class CityMapViewController: BaseViewController<CityMapView> {
    private var mapContainer: MKMapView? = nil
    private var cityName: String?
    private var latitude: Double?
    private var longitude: Double?
    private var locationCoord : CLLocationCoordinate2D?
    private let annotation = MKPointAnnotation()

    init(with cityObject: CityObject) {
        super.init(nibName: nil, bundle: nil)
        self.cityName = cityObject.name
        self.latitude = cityObject.coord.lat
        self.longitude = cityObject.coord.lon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func setupBehaviours() {
        self.title = cityName ?? "City"
                
        mapContainer = self.view.viewWithTag(1) as? MKMapView
        mapContainer?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if (latitude != nil) && (longitude != nil) {
            locationCoord = CLLocationCoordinate2DMake(latitude!, longitude!)
            let span = MKCoordinateSpanMake(2.0, 2.0)
            let region = MKCoordinateRegion(center: locationCoord!, span: span)
            mapContainer?.setRegion(region, animated: true)
            
            annotation.coordinate = locationCoord!
            mapContainer?.addAnnotation(annotation)
        }
    }
}
