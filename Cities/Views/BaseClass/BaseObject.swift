//
//  BaseObject.swift
//  Cities
//
//  Created by Ronald on 15/06/2021.
//  Copyright © 2021 Ronald Kimutai. All rights reserved.
//

import UIKit

class BaseObject: NSObject {

    convenience init(dictionary: [String:Any]) {
        self.init()
        for (key, value) in dictionary {
            if !(value is NSNull) {
                if (value is NSNumber) {
                    let valueRef:NSNumber = value as? NSNumber ?? 0
                    setValue(valueRef.stringValue  , forKey: key )
                }
                else {
                    setValue(value  , forKey: key )
                }
            }
        }
    }
    
    override public func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
