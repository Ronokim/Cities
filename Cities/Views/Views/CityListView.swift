//
//  CityListView.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

final class CityListView: BaseView {

    private var citiesTableView : UITableView = UITableView().layoutable()
    private var scrollButton : UIButton = UIButton().layoutable()
    private let scrollButtonWidth: CGFloat = 50.0
    private let scrollButtonHeight:CGFloat = 50.0
    private let scrollButtonTrailingOffset:CGFloat = -50.0
    private let scrollButtonBottomOffset:CGFloat = -50.0
    
    ///  layout items in the view
    override func setupViewHierarchy() {
        addSubviews([citiesTableView, scrollButton])
    }
    
    ///  add properties to the view items
    override func setupProperties() {
        
        ///  table view properties
        citiesTableView.tag = 1
        
        ///  button properties
        scrollButton.backgroundColor = UIColor.white
        scrollButton.setImage(UIImage(named: "ic_hand_up_black"), for: .normal)
        scrollButton.addCornerRadius(scrollButtonWidth/2)
        scrollButton.layer.shadowRadius = 3
        scrollButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        scrollButton.layer.shadowOpacity = 0.8
        scrollButton.tag = 2
    }
    
    ///  add constraints to the view items
    override func setupConstraints() {
        /// tableView constraints
        citiesTableView.fill(self)
        
        /// scroll button constraints
        scrollButton.trailingAnchor.align(to: trailingAnchor, offset: scrollButtonTrailingOffset)
        scrollButton.topAnchor.align(to: safeAreaLayoutGuide.bottomAnchor, offset: scrollButtonBottomOffset)
        NSLayoutConstraint.activate([
            scrollButton.widthAnchor.constraint(equalToConstant: scrollButtonWidth),
            scrollButton.heightAnchor.constraint(equalToConstant: scrollButtonHeight),
        ])
        
    }
}
