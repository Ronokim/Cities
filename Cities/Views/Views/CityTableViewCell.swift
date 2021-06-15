//
//  CityTableViewCell.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

final class CityTableViewCell: BaseTableViewCell {

    var cityLabel: UILabel = UILabel().layoutable()
    var countryLabel: UILabel = UILabel().layoutable()
    private let contentLeadingOffset: CGFloat = 20
    
    override func setupViewHierarchy() {
        contentView.addSubviews([cityLabel, countryLabel])
    }
    
    override func setupProperties() {
        /// city label properties
        cityLabel.textColor = UIColor.black
        cityLabel.backgroundColor = UIColor.clear
        cityLabel.textAlignment = NSTextAlignment.left
        cityLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cityLabel.numberOfLines = 0
        cityLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 0))
        
        ///  country label properties
        countryLabel.textColor = UIColor.black
        countryLabel.backgroundColor = UIColor.clear
        countryLabel.textAlignment = NSTextAlignment.left
        countryLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        countryLabel.numberOfLines = 0
        countryLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(rawValue: 1))
    }
    
    override func setupConstraints() {
        /// city label constraints
        cityLabel.topAnchor.align(to: topAnchor, offset: 20)
        cityLabel.leadingAnchor.align(to: contentView.leadingAnchor, offset: contentLeadingOffset)
        cityLabel.trailingAnchor.align(to: contentView.trailingAnchor)
        
        ///  country label constraints
        countryLabel.topAnchor.align(to: cityLabel.lastBaselineAnchor, offset: 5)
        countryLabel.leadingAnchor.align(to: contentView.leadingAnchor, offset: contentLeadingOffset)
        countryLabel.trailingAnchor.align(to: contentView.trailingAnchor)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
