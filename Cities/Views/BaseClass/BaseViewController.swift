//
//  BaseViewController.swift
//  Cities
//
//  Created by Ronald on 15/06/2021.
//  Copyright © 2021 Ronald Kimutai. All rights reserved.
//
//  ---------------------
//  Super class to be implemented on all view controllers with common base / attributes

import UIKit

class BaseViewController<ViewType: UIView>: UIViewController, UISearchBarDelegate {
    /// Provides typed access to the view controllers custom view
    public var customView: ViewType { return self.view as! ViewType }
    
    public override func loadView() {
        super.loadView()
        self.view = ViewType(frame: .zero)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupBehaviours()
        setupCallbacks()
        setupProperties()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().tintColor = UIColor.blue

        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupBehaviours() {}
    
    func setupProperties() {}
    
    func setupCallbacks() {}
}
