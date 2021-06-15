//
//  UIView+Extensions.swift
//  Cities
//
//  Created by Ronald on 15/06/2021.
//  Copyright © 2021 Ronald Kimutai. All rights reserved.
//

import UIKit

public extension UIView {
    func layoutable() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    @discardableResult
    func addCornerRadius(_ radius: CGFloat, borderColor: UIColor = .clear, borderWidth: CGFloat = 0.0) -> Self {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
        return self
    }
    
    /// center item in parent view
    /// - parameters
    ///     - view: pass parent view to center in.
    func center(in view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    /// fill item in parent view
    /// - parameters
    ///     - view: parent view
    ///     - offset: basically the padding from parent view
    func fill(_ view: UIView, offset: CGFloat = 0.0) {
        leftAnchor.align(to: view.leftAnchor, offset: offset)
        rightAnchor.align(to: view.rightAnchor, offset: -offset)
        topAnchor.align(to: view.topAnchor, offset: offset)
        bottomAnchor.align(to: view.bottomAnchor, offset: -offset)
    }
}

public extension NSLayoutDimension {
    func align(to anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, offset: CGFloat = 0.0) {
        constraint(equalTo: anchor, multiplier: multiplier, constant: offset).isActive = true
    }
    func equal(to value: CGFloat) {
        constraint(equalToConstant: value).isActive = true
    }
}
public extension NSLayoutXAxisAnchor {
    func align(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0) {
        constraint(equalTo: anchor, constant: offset).isActive = true
    }
}
public extension NSLayoutYAxisAnchor {
    func align(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0) {
        constraint(equalTo: anchor, constant: offset).isActive = true
    }
}
extension UIScrollView {
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
    }
}





