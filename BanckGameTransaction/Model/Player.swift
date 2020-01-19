//
//  Player.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 19/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import Foundation
import RealmSwift

class Player: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    @objc dynamic var balance: Double = 0.0
    var parentCategory = LinkingObjects(fromType: GamePlaying.self, property: "players")
    
}
