//
//  CityListView.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

class CityListView: UIView {

    var scrollView :UIScrollView = UIScrollView()
    let screenSize: CGRect = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height - 40
        let viewController = CityListViewController()
        
        self.backgroundColor = UIColor.white
        
        let tableView : UITableView = UITableView(frame: CGRect(x: 0, y: 0, width:screenWidth, height: screenHeight))
        tableView.tag = 1
        tableView.dataSource = viewController
        tableView.delegate = viewController
        self.addSubview(tableView)
        
        
    }
    
}
