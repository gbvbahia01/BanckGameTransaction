//
//  Transaction.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 19/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import Foundation
import RealmSwift

class Transaction: Object {
     @objc dynamic var namePaid: String = ""
     @objc dynamic var colorPaid: String = ""
    
    @objc dynamic var nameReceived: String = ""
    @objc dynamic var colorReceived: String = ""
    
    @objc dynamic var value: Double = 0.0
    
    var parentCategory = LinkingObjects(fromType: GamePlaying.self, property: "transactions")
}
