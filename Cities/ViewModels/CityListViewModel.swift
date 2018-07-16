//
//  CityListViewModel.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import Foundation

struct CityListViewModel {
    var cityArray = [CityObject]()
    var defaultCityArray = [CityObject]()
    
    //MARK: - bool var for reload UITableView
    var shouldReloadTable : Bool?  = true{
        didSet {
            shouldReloadTableCallback?(shouldReloadTable!)
        }
    }
    
    //MARK: - callBack method to reload UITableView
    var shouldReloadTableCallback : ((_ shouldReloadTable: Bool) -> Void)?
    
    
    //MARK: - bool var to manage activity indicator
    var isLoading: Bool = true {
        didSet {
            showActivityIndicatorCallback?(isLoading)
        }
    }
    
    //MARK: - callBack method to reload UITableView
    var showActivityIndicatorCallback : ((_ isLoading: Bool) -> Void)?
    
    init() {
        
    }
    
    
    public mutating func loadData() {
        if let path =  Bundle.main.path(forResource: "cities", ofType: "json") {
            isLoading = true
            do {
                //let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options:.alwaysMapped)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: .mutableLeaves)
                
                defaultCityArray = CityObject.modelsFromArray(array: jsonResult as! [[String : Any]])
                cityArray = defaultCityArray
                shouldReloadTable = true
                isLoading = false
            } catch {
                // handle error
                isLoading = false
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
    
    
    mutating func searchCity(searchText: String){
        var filteredCityArray = [CityObject]()
        filteredCityArray = defaultCityArray.filter({ (key) -> Bool in
            key.name.localizedLowercase.hasPrefix(searchText.localizedLowercase) 
        })
        cityArray = filteredCityArray
        shouldReloadTable = true
        //return filteredCityArray
    }
    
}
