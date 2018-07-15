//
//  CityObject.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import Foundation
typealias JSON = [String: Any]

struct CityObject {
    var id: NSNumber
    var name: String
    var country: String
    var coordinates: NSDictionary
}


extension CityObject{
    init(json: JSON) {
        
        self.id = json["_id"] as! NSNumber
        self.name = json["name"] as! String
        self.country = json["country"] as! String
        self.coordinates = json["coord"] as! NSDictionary
    }
}
