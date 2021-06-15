//
//  CityListViewModelTests.swift
//  CitiesTests
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import XCTest

class CityListViewModelTests: XCTestCase {
    
    var cityListViewModel: CityListViewModel = CityListViewModel()
    var cityArray = [CityObject]()
    var city1: CityObject?
    var city2: CityObject?
    var city3: CityObject?
    var city4: CityObject?
    var city5: CityObject?
    var city6: CityObject?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        city1 = CityObject(id: 4829764, name: "Alabama", country: "US", coord: Coord(lon: -86.750259, lat: 32.750408))//["lon":-86.750259,"lat":32.750408])
        city2 = CityObject(id: 5454711, name: "Albuquerque", country: "US", coordinates: ["lon":-106.651138,"lat":35.084492])
        city3 = CityObject(id: 5323810, name: "Anaheim", country: "US", coordinates: ["lon":-117.914497,"lat":33.835289])
        city4 = CityObject(id: 5551752, name: "Arizona", country: "US", coordinates: ["lon":-111.500977,"lat":34.500301])
        city5 = CityObject(id: 2147714, name: "Sydney", country: "AU", coordinates: ["lon":151.207321,"lat":-33.867851])
        city6 = CityObject(id: 2140714, name: "neySyd", country: "AU", coordinates: ["lon":151.207321,"lat":-33.867851])
        cityArray = [city1, city2, city3, city4, city5, city6] as! [CityObject];
        cityListViewModel.defaultCityArray = cityArray
        cityListViewModel.cityArray = cityArray
//        cityArray = cityListViewModel.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testSearchCity(){
        let expectedFilteredArray = [city5] as! [CityObject]
        let expectedCityName = "Sydney"
        
        cityListViewModel.searchCity(searchText: "Syd")
        let filteredArray = cityListViewModel.cityArray
        
        XCTAssertEqual(filteredArray?[0].name, expectedFilteredArray[0].name , "Search city failed")
        XCTAssertEqual(filteredArray?[0].name, expectedCityName , "Search city failed")
        XCTAssertEqual(filteredArray?.count, 1, "Filtered array count failed")
        XCTAssertFalse(filteredArray?[0].name == "neySyd", "Negative Search city failed")
    }
    
    
    func testSearchCityEmptyResult(){
        //var expectedFilteredArray = [CityObject]()
        let expectedFilteredArray = [] as! [CityObject]
        cityListViewModel.searchCity(searchText: "X")
        let filteredArray = cityListViewModel.cityArray
        
        XCTAssertTrue(filteredArray?.count == 0, "Filtered array is not empty")
        XCTAssertEqual(filteredArray?.count, expectedFilteredArray.count, "Number of rows failed")
    }
    
    
    func testNumberOfRowsInSection(){
        let expectedNumberOfRows = cityArray.count
        let numberOfRows = cityListViewModel.cityArray?.count
        
        XCTAssertEqual(numberOfRows, expectedNumberOfRows, "Number of rows failed")
    }
    
    
    func testSortCity(){
        let expectedCity1 = "Alabama"
        let expectedCity2 = "Albuquerque"
        let expectedCity3 = "Anaheim"
        let expectedCity6 = "Sydney"
        
        //cityListViewModel.sortCity()
        cityListViewModel.defaultCityArray = cityArray
        let sortedArray = cityListViewModel.sortCity()
        
        XCTAssertEqual(sortedArray[0].name, expectedCity1 , "expectedCity1 position sort failed")
        XCTAssertEqual(sortedArray[1].name, expectedCity2 , "expectedCity2 position sort failed")
        XCTAssertEqual(sortedArray[2].name, expectedCity3 , "expectedCity3 position sort failed")
        XCTAssertEqual(sortedArray[5].name, expectedCity6 , "expectedCity6 position sort failed")
    }
    
}
