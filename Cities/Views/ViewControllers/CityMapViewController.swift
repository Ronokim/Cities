//
//  CityMapViewController.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit
import MapKit

class CityMapViewController: UIViewController {
    var mapContainer: MKMapView? = nil
    var cityMapView: CityMapView? = nil
    var cityName: String?
    var latitude: Double?
    var longitude: Double?
    var locationCoord : CLLocationCoordinate2D?
    let annotation = MKPointAnnotation()
    
    override func loadView()  {
        super.loadView()
        
        self.title = cityName ?? "Cities"
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().tintColor = UIColor.blue
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        cityMapView = CityMapView(frame: CGRect.zero)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = cityMapView
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
