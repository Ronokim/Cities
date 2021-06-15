//
//  CityActivityIndicatorView.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

//class CityActivityIndicatorView: UIView {
//
//    let screenSize: CGRect = UIScreen.main.bounds
//    var scrollView :UIScrollView = UIScrollView()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.addCustomView()
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func addCustomView() {
//
//        let screenWidth = screenSize.width
//        let screenHeight = screenSize.height
//        let xpos = (screenWidth - 60)/2
//        let ypos = (screenHeight - 60)/2
//
//        self.backgroundColor = UIColor.black
//
//        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight ))
//        scrollView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
//        self.addSubview(scrollView)
//
//        let activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: xpos, y: ypos, width: 60, height: 60))
//            //UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
//        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
//        activityIndicatorView.startAnimating()
//        scrollView.addSubview(activityIndicatorView)
//    }
//
//}

class CityActivityIndicatorView: BaseView {

    private var containerView :UIScrollView = UIScrollView(frame: .zero).layoutable()
    private var activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView(frame: .zero).layoutable()
    private let activityIndicatorWidth: CGFloat = 60.0


    ///  layout items in the view
    override func setupViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(activityIndicatorView)
    }

    ///  add properties to the view items
    override func setupProperties() {
        
        self.backgroundColor = .black
        ///  containerView properties
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.7)

        ///  activityIndicatorView properties
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.startAnimating()
    }

    ///  add constraints to the view items
    override func setupConstraints() {
        /// containerView constraints
        containerView.fill(self)

        /// activityIndicatorView constraints
        NSLayoutConstraint.activate([
            activityIndicatorView.widthAnchor.constraint(equalToConstant: activityIndicatorWidth),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: activityIndicatorWidth),
        ])
        activityIndicatorView.center(in: containerView)

    }
}
