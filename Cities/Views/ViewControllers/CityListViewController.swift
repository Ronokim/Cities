//
//  CityListViewController.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

final class CityListViewController: BaseViewController<CityListView> {
    
    private var citiesTableList: UITableView?
    private let cellIdendifier: String = "CityCell"
    private var activityIndicator : CityActivityIndicatorView? = nil
    private var viewModel: CityListViewModel = CityListViewModel()
    private var searchString: String?
    private var searchWasCancelled = false
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func setupBehaviours() {
        self.title = "Cities"
        
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
    }
    
    override func setupProperties() {
        DispatchQueue.global(qos: .userInteractive).async {
            self.viewModel.loadData()
        }
    }
    
    override func setupCallbacks() {
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
        
        guard let cityObject: CityObject = viewModel.cityArray?[indexPath.row] else{
            return cell
        }
        cell.cityLabel.text = cityObject.name
        cell.countryLabel.text = cityObject.country
        
        return cell
    }
    
}


//MARK: - UITableViewDelegate methods
extension CityListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cityObject: CityObject = viewModel.cityArray?[indexPath.row] else {
            return
        }
        let controller: CityMapViewController = CityMapViewController(with: cityObject)
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
extension CityListViewController{
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
