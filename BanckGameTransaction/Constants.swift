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
        static let TABLE_HEADER_PLAYERS = "Jogadores Cadastrados"
        static let TABLE_HEADER_BALANCE = "Jogadores"
        static let TABLE_HEADER_TRANSACTIONS = "Transações"
        
        static let TABLE_HEADER_TRANSACTION_PAY = "Jogador a pagar:"
        static let TABLE_HEADER_TRANSACTION_RECEIVE = "Jogador a receber:"
        
        static let BANK_NAME = "Banco"
        
        static let ALERT_TITLE_INVALID_NAME = "Nome Inválido"
        static let ALERT_MSG_INVALID_NAME = "O nome é inválido para a cor ?1"
        
        static let ALERT_TITLE_INVALID_AMOUNT_PLAYERS = "Quantidade de Jogadores"
        static let ALERT_MSG_INVALID_AMOUNT_PLAYERS = "São necessários no mínimo 2 jogadores"
        
        static let ALERT_TITLE_INVALID_VALUE = "Valor Inválido"
        static let ALERT_MSG_INVALID_VALUE = "O valor inicial ?1 é inválido."
        static let ALERT_MSG_EMPTY_INVALID_VALUE = "O valor inicial deve ser informado."
        static let ALERT_MSG_INVALID_TRANSACTION_VALUE = "O valor ?1 é inválido."
        static let ALERT_MSG_EMPTY_INVALID_TRANSACTION_VALUE = "O valor da transação deve ser informado."
        
        static let ALERT_TITLE_INSUFFICIENT_FUNDS = "Saldo insuficiente"
        static let ALERT_MSG_INSUFFICIENT_FUNDS = "Jogador ?1 não tem saldo suficiente para essa transação"
        
        static let ALERT_TITLE_SELECT_PLAYER = "Selecione Jogadores"
        static let ALERT_MSG_SELECT_PLAYER = "Selecione pelo menos um jogador a pagar e um jogador a receber"
        
        static let ALERT_ACTION_OK = "Ok"
        static let ALERT_ACTION_YES = "Sim"
        static let ALERT_ACTION_NO = "Não"
        static let ALERT_ACTION_CANCEL = "Cancelar"
        
        static let ALERT_ACTION_END_GAME_ALERT_TITLE = "Terminar Jogo"
        static let ALERT_ACTION_END_GAME_ALERT_MSG = "O jogo será temrinado e declarado o vencedor o jgador com maior saldo."
        
        static let COLOR_NAME_BLUE = "Azul"
        static let COLOR_NAME_BLACK = "Preto"
        static let COLOR_NAME_YELLOW = "Amarelo"
        static let COLOR_NAME_GREEN = "Verde"
        static let COLOR_NAME_WHITE = "Branco"
        static let COLOR_NAME_RED = "Vermelho"
        
    }
    
    struct ASSETS_NAME {
        static let COLOR_LIGHT_GRAY = "AppLightGray"
        static let COLOR_ORANGE = "AppOrange"
        static let COLOR_RED = "AppRed"
        static let COLOR_BLUE = "AppBlue"
        static let MISS_COLOR = "FF00FF"
        static let COLOR_0 = "Transparent"
        
        static let IMG_BANK = "bank_icon"
    }
    
    struct SEGUE {
        static let TO_PLAYERS_PAGE = "toPlayersPage"
        static let TO_MONEY_PAGE = "toStartMoneyPage"
        static let TO_GAME_PAGE = "goToGame"
        static let TO_TRANSACTION_PAGE = "goToTransaction"
        static let TO_ENDGAME_PAGE = "goToEndGame"
        static let BACK_START_PAGE = "backToStart"
    }
    
    struct TABLE_CELL {
        static let PLAYER_SELECTED_ID = "cellPlayerSelected"
        static let PLAYER_SELECTED_NIB = "PlayerSelectedViewCell"
        
        static let BANK_BALANCE_ID = "cellBanckBalance"
        static let BANK_BALANCE_NIB = "BanckBalanceViewCell"
        
        static let BANK_TRANSACTION_ID = "cellBanckTransaction"
        static let BANK_TRANSACTION_NIB = "BanckTransactionViewCell"
        
        static let TRANSACTION_PLAYER_ID = "cellTransactionPlayer"
        static let TRANSACTION_PLAYER_NIB = "TransactionPlayerViewCell"
    }
    
    struct TABLE_ID {
        static let BANK_BALANCE_ID = "tablePlayerBalanceID"
        static let BANK_TRANSACTION_ID = "tablePlayerTransactionID"
        
        static let TRANSACTION_TABLE_PAY_ID = "tablePlayerWillPaiID"
        static let TRANSACTION_TABLE_RECEIVE_ID = "tablePlayerWillReceiveID"
        
    }
    
    struct STATUS_GAME {
        static let PLAYING = "Playing"
        static let ENDED = "Ended"
    }
    
    struct LOCALE {
        static let PT_BR = "pt_BR"
        static let EN_US = "en_US"
        static let FR_FR = "fr_FR"
    }
}
