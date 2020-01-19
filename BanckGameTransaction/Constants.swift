//
//  Constants.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 13/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import Foundation

struct K {
    struct GAME_TEXT {
        static let TABLE_HEADER_BALANCE = "Jogadores"
        static let TABLE_HEADER_TRANSACTIONS = "Transações"
        
        static let TABLE_HEADER_TRANSACTION_PAY = "Jogador a pagar:"
        static let TABLE_HEADER_TRANSACTION_RECEIVE = "Jogador a receber:"
    }
    
    struct ASSETS_NAME {
        static let COLOR_LIGHT_GRAY = "AppLightGray"
        static let COLOR_ORANGE = "AppOrange"
        static let COLOR_RED = "AppRed"
        static let COLOR_BLUE = "AppBlue"
    }
    
    struct SEGUE {
        static let TO_PLAYERS_PAGE = "toPlayersPage"
        static let TO_MONEY_PAGE = "toStartMoneyPage"
        static let TO_GAME_PAGE = "goToGame"
        static let TO_TRANSACTION_PAGE = "goToTransaction"
        static let TO_ENDGAME_PAGE = "goToEndGame"
        static let BACK_TRANSACTION_PAGE = "backToTransaction"
        static let BACK_START_PAGE = "backToStart"
    }
    
    struct TABLE_CELL {
        static let BANCK_BALANCE_ID = "cellBanckBalance"
        static let BANCK_BALANCE_NIB = "BanckBalanceViewCell"
        
        static let BANCK_TRANSACTION_ID = "cellBanckTransaction"
        static let BANCK_TRANSACTION_NIB = "BanckTransactionViewCell"
        
        static let TRANSACTION_PLAYER_ID = "cellTransactionPlayer"
        static let TRANSACTION_PLAYER_NIB = "TransactionPlayerViewCell"
    }
    
    struct TABLE_ID {
        static let BANCK_BALANCE_ID = "tablePlayerBalanceID"
        static let BANCK_TRANSACTION_ID = "tablePlayerTransactionID"
        
        static let TRANSACTION_TABLE_PAY_ID = "tablePlayerWillPaiID"
        static let TRANSACTION_TABLE_RECEIVE_ID = "tablePlayerWillReceiveID"
        
    }
}
