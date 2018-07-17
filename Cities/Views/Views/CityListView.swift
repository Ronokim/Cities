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
        
        
        let scrollButton : UIButton = UIButton(frame : CGRect(x : screenWidth - 70, y : screenHeight - 100, width: 50, height : 50))
        scrollButton.backgroundColor = UIColor.white
        scrollButton.setImage(UIImage(named: "ic_hand_up_black"), for: .normal)
        scrollButton.layer.cornerRadius = 25
        scrollButton.layer.shadowRadius = 2
        scrollButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        scrollButton.layer.shadowOpacity = 0.8
        scrollButton.tag = 2
        self.addSubview(scrollButton)
        
    }
    
}
