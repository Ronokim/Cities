//
//  CityListViewController.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    var citiesTableList: UITableView?
    var cellIdendifier: String = "CityCell"
    var activityIndicator : CityActivityIndicatorView? = nil
    
    var viewModel: CityListViewModel = CityListViewModel()
    var searchString: String?
    var searchWasCancelled = false
    
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
        
        let cityListView = CityListView(frame: CGRect.zero)
        self.view = cityListView
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        
        citiesTableList =  self.view.viewWithTag(1) as! UITableView?
        citiesTableList?.register(CityTableViewCell.self, forCellReuseIdentifier: cellIdendifier)
        citiesTableList?.tableFooterView = UIView()
        citiesTableList?.delegate = self
        citiesTableList?.dataSource = self
        
        
        let scrollButton: UIButton = (self.view.viewWithTag(2) as! UIButton?)!
        scrollButton.addTarget(self, action:#selector(buttonListener(sender:)), for: UIControlEvents.touchUpInside)
        
        activityIndicator = CityActivityIndicatorView(frame: CGRect.zero)
        
        viewModel.shouldReloadTableCallback = {[weak self] (shouldReload) in
            if shouldReload {
                DispatchQueue.main.async {
                    self?.citiesTableList?.reloadData()
                }
                
            }
        }
        
        
        viewModel.showActivityIndicatorCallback = { [weak self] (showActivity) in
            DispatchQueue.main.async {
                if showActivity {
                    self?.view.addSubview((self?.activityIndicator!)!)
                }else {
                    self?.activityIndicator?.removeFromSuperview()
                }
            }
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.viewModel.loadData()
        }
        
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
    
    
    //MARK: - button listener method
    @objc func buttonListener(sender:UIButton) {
        citiesTableList?.setContentOffset(.zero, animated: true)
    }
    
}


//MARK: - UITableViewDataSource methods
extension CityListViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdendifier, for: indexPath as IndexPath) as! CityTableViewCell
        
        let rowDictionary = viewModel.cityArray[indexPath.row]
        
        let cityName = rowDictionary.name
        let countryName = rowDictionary.country
        
        
        cell.cityLabel.text = cityName
        cell.countryLabel.text = countryName
        
        return cell
    }
    
}


//MARK: - UITableViewDelegate methods
extension CityListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let rowDictionary = viewModel.cityArray[indexPath.row]
        
        let cityName = rowDictionary.name
        //let countryName = rowDictionary.country
        
        let coordinates = rowDictionary.coordinates
        let latitude = coordinates.value(forKey: "lat")
        let longitude = coordinates.value(forKey: "lon")
        
        
        let controller: CityMapViewController = CityMapViewController()
        controller.latitude = latitude as? Double
        controller.longitude = longitude as? Double
        controller.cityName = cityName
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


//MARK: - UISearchResultsUpdating methods
extension CityListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            DispatchQueue.global(qos: .userInteractive).async {
                self.viewModel.searchCity(searchText: text)
            }
            self.searchString = text
        }
        else {
            searchString = ""
            DispatchQueue.global(qos: .userInteractive).async {
                self.viewModel.searchCity(searchText: self.searchString!)
            }
            
        }
    }
    
}


//MARK: - UISearchBarDelegate delegate methods
extension CityListViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchWasCancelled = false
        print("searchBarTextDidBeginEditing")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchWasCancelled = true
        print("searchBarCancelButtonClicked")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing")
        if searchWasCancelled {
            //searchBar.text = self.searchString
        } else {
            //self.searchString = searchBar.text
            self.navigationItem.searchController?.searchBar.text = self.searchString
        }
    }
}
