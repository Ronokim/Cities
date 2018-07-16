//
//  CityActivityIndicatorView.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import UIKit

class CityActivityIndicatorView: UIView {

    let screenSize: CGRect = UIScreen.main.bounds
    var scrollView :UIScrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height 
        let xpos = (screenWidth - 60)/2
        let ypos = (screenHeight - 60)/2
        
        self.backgroundColor = UIColor.black
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight ))
        scrollView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.addSubview(scrollView)
        
        let activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: xpos, y: ypos, width: 60, height: 60))
            //UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.startAnimating()
        scrollView.addSubview(activityIndicatorView)
    }

}
