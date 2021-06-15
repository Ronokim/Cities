//
//  CityListViewModel.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import Foundation

struct CityListViewModel {
    var cityArray: CitiesObject?
    var defaultCityArray: CitiesObject?
    
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
    
    
    var currentSearchText: String? = "" {
        didSet { setCurrentSearchTextCallback?(currentSearchText)
        }
    }
    
    var setCurrentSearchTextCallback : ((_ searchText: String?) -> Void)?
    
    init() {}
    
    
    public mutating func loadData() {
        if let path =  Bundle.main.path(forResource: "cities", ofType: "json") {
            isLoading = true
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options:.alwaysMapped)
                
                self.defaultCityArray = Array.init(data: data)
                defaultCityArray = self.sortCity()
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
        return cityArray?.count ?? 0
    }
    
    
    mutating func searchCity(searchText: String){
        //Filter using higher order function filter based on prefix = searchText
        cityArray = defaultCityArray?.filter({ (key) -> Bool in
            key.name.localizedLowercase.hasPrefix(searchText.localizedLowercase) 
        })
        currentSearchText = searchText
        
        //reload UITableView with new filtered data
        shouldReloadTable = true
    }
    
    
    mutating func sortCity() -> [CityObject]{
        return defaultCityArray?.sorted(by: { $0.name.localizedLowercase < $1.name.localizedLowercase }) ?? []
    }
    
}
