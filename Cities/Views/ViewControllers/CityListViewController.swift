//
//  CityListViewController.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {

//    var cityListView: CityListView = CityListView()
    var citiesTableList: UITableView?
    var cellIdendifier: String = "CityCell"
    var cities = [CityObject]()
    
    override func loadView() {
        super.loadView()
        
        self.title = "Cities"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().tintColor = UIColor.blue
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cityListView = CityListView(frame: CGRect.zero)
        //cityListView.addCustomView()
        
        let cityListView = CityListView(frame: CGRect.zero)
        self.view = cityListView
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        citiesTableList =  self.view.viewWithTag(1) as! UITableView?
        citiesTableList?.register(CityTableViewCell.self, forCellReuseIdentifier: cellIdendifier)
        citiesTableList?.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }

}


//MARK: - UITableViewDataSource methods
extension CityListViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdendifier, for: indexPath as IndexPath) as! CityTableViewCell
        
        let rowDictionary = cities[indexPath.row]
        
        let cityName = rowDictionary.name //rowDictionary.value(forKey: "name")
        let countryName = rowDictionary.country // rowDictionary.value(forKey: "country")
        
        
        cell.cityLabel.text = cityName
        cell.countryLabel.text = countryName
        
        return cell
    }
    
}


//MARK: - UITableViewDelegate methods
extension CityListViewController: UITableViewDelegate{
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let rowDictionary = cities[indexPath.row]
        
        //get selected city details
        let cityName = rowDictionary.name
        let countryName = rowDictionary.country 
        
        let coordinates = rowDictionary.coordinates
        let latitude = coordinates.value(forKey: "lat")
        let longitude = coordinates.value(forKey: "lon")
        
        print("Selected city \(String(describing: cityName)),\(countryName) - Coords: \(String(describing: latitude)),\(String(describing: longitude))")
        
        
        //        let controller: CityMapViewController = CityMapViewController()
        //        controller.latitude = latitude
        //        controller.longitude = longitude
        //        self.navigationController?.pushViewController(controller, animated: true)
    }
}


//MARK: - UISearchResultsUpdating methods
extension CityListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}


