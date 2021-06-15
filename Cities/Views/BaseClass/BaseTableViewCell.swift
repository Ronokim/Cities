//
//  BaseTableViewCell.swift
//  Cities
//
//  Created by Ronald on 15/06/2021.
//  Copyright © 2021 Ronald Kimutai. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// required methods
    func setupViewHierarchy() { abstractMethod() }
    
    func setupConstraints() { abstractMethod() }
    
    func setupProperties() { abstractMethod() }
}
