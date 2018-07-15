//
//  CityTableViewCell.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    var icon: UIImageView = UIImageView()
    var cityLabel: UILabel = UILabel()
    var countryLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(icon)
        self.contentView.addSubview(cityLabel)
        self.contentView.addSubview(countryLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        icon.frame = CGRect(x: self.bounds.width - 40, y: 10, width: 30, height: 30)
        icon.contentMode = UIViewContentMode.scaleAspectFit
        icon.backgroundColor = UIColor.clear
        icon.clipsToBounds = true
        icon.tintColor = .black
        
        cityLabel.frame = CGRect(x: 20 , y: 10, width: self.bounds.width - 60, height: 20)
        cityLabel.textColor = UIColor.black
        cityLabel.backgroundColor = UIColor.clear
        cityLabel.textAlignment = NSTextAlignment.left
        cityLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cityLabel.numberOfLines = 0
        cityLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 0))
        
        countryLabel.frame = CGRect(x: 20, y: cityLabel.frame.size.height + cityLabel.frame.origin.y + 5, width: self.bounds.width - 60, height: 25)
        countryLabel.textColor = UIColor.black
        countryLabel.backgroundColor = UIColor.clear
        countryLabel.textAlignment = NSTextAlignment.left
        countryLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        countryLabel.numberOfLines = 0
        countryLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(rawValue: 1))
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
