//
//  CityListViewModel.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import Foundation

struct CityListViewModel {
    //var cityArray = Array<CityObject>()
    var cityArray = [CityObject]()
    var shouldReloadTable : Bool?  = true{
        didSet {
            shouldReloadTableCallback?(shouldReloadTable!)
        }
    }
    
    //MARK: - callBack method to reload UITableView
    var shouldReloadTableCallback : ((_ shouldReloadTable: Bool) -> Void)?
    
    init() {
        
    }
    
    
    public mutating func loadData() {
        if let path =  Bundle.main.path(forResource: "cities", ofType: "json") {
            do {
                //let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options:.alwaysMapped)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: .mutableLeaves)
                
                cityArray = CityObject.modelsFromArray(array: jsonResult as! [[String : Any]])
                
                shouldReloadTable = true
            } catch {
                // handle error
                print("Fatal error: ")
                fatalError(error.localizedDescription)
            }
        }
        else{
            print("Local path not found")
        }
    }
    
    
    func numberOfRowsInSection() -> Int {
        return cityArray.count
    }
}
