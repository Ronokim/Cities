//
//  BaseView.swift
//  Cities
//
//  Created by Ronald on 15/06/2021.
//  Copyright © 2021 Ronald Kimutai. All rights reserved.
//
//  ---------------------
//  Super class to be implemented on all views classes with enforced methods to override

import UIKit

public func abstractMethod() -> Never {
    fatalError("this method should be overriden")
}

open class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        setupViewHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    /// required method, should override
    open func setupViewHierarchy() {
        abstractMethod()
    }
    
    /// required method, should override
    open func setupConstraints() {
        abstractMethod()
    }
    
    /// Optional method.
    open func setupProperties() { }
}
