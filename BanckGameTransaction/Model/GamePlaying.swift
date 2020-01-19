//
//  GamePlaying.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 19/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import Foundation
import RealmSwift

class GamePlaying: Object {
    
    @objc dynamic var status: String = K.STATUS_GAME.PLAYING
    var players = List<Player>()
    var transactions = List<Transaction>()
    
}
