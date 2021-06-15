//
//  UIViewController+Extensions.swift
//  Cities
//
//  Created by Ronald on 15/06/2021.
//  Copyright © 2021 Ronald Kimutai. All rights reserved.
//

import UIKit

extension UIViewController {
    func popBack(_ nb: Int) {
        if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            guard viewControllers.count < nb else {
                self.navigationController?.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
                return
            }
        }
    }
    
    func setAlert(title: String?, message: String?, onCompleted: (() -> Void)? = nil) {
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            onCompleted?()
        }))
        
        self.present(alertVc, animated: true)
    }
}
