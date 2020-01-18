//
//  ExtNSLayoutConstraint.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 15/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" 
    }
}
