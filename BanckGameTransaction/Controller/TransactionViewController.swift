//
//  TransactionViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 18/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class TransactionViewController: ViewController {
    
    @IBOutlet weak var tablePlayerWillPay: UITableView!
    @IBOutlet weak var tablePlayerWillReceive: UITableView!
    @IBOutlet weak var transactionValueField: CurrencyField!
    
     var game: GamePlaying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenNavigation = true
        
        tablePlayerWillPay.dataSource = self
        tablePlayerWillPay.delegate = self
        
        tablePlayerWillReceive.dataSource = self
        tablePlayerWillReceive.delegate = self
        
        registerCell(with: tablePlayerWillPay,
                     nibFile: K.TABLE_CELL.TRANSACTION_PLAYER_NIB,
                     cellId: K.TABLE_CELL.TRANSACTION_PLAYER_ID)
        
        registerCell(with: tablePlayerWillReceive,
                     nibFile: K.TABLE_CELL.TRANSACTION_PLAYER_NIB,
                     cellId: K.TABLE_CELL.TRANSACTION_PLAYER_ID)
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        print(#function)
        let money = (transactionValueField.decimal as NSDecimalNumber).doubleValue
        if (money <= 0) {
            valueInvalid(String(money))
            return
        }
        
        let cellsPay = self.tablePlayerWillPay.visibleCells as! Array<TransactionPlayerViewCell>
        let cellsReceive = self.tablePlayerWillReceive.visibleCells as! Array<TransactionPlayerViewCell>
        var selectPay = false
        var selectRec = false
        for cellPay in cellsPay {
            if cellPay.checkBox.isChecked {
                selectPay = true
                for cellReceive in cellsReceive {
                    if cellReceive.checkBox.isChecked {
                        selectRec = true
                        if cellPay.playerName.text != cellReceive.playerName.text {
                            
                            if let playerPaid = searchPlayerByName(cellPay.playerName.text, money),
                               let playerReceived = searchPlayerByName(cellReceive.playerName.text, money) {
                                
                                if playerPaid.balance < money {
                                    alertFunds(playerPaid)
                                    return
                                }
                                
                                let transaction = Transaction()
                                //Paid
                                transaction.colorPaid = cellPay.playerColor.backgroundColor?.hexString ?? K.ASSETS_NAME.MISS_COLOR
                                transaction.namePaid = cellPay.playerName.text ?? K.GAME_TEXT.ALERT_TITLE_INVALID_NAME
                                //Received
                                transaction.colorReceived = cellReceive.playerColor.backgroundColor?.hexString ?? K.ASSETS_NAME.MISS_COLOR
                                transaction.nameReceived = cellReceive.playerName.text ?? K.GAME_TEXT.ALERT_TITLE_INVALID_NAME
                                
                                transaction.value = money
                                game?.transactions.insert(transaction, at: 0)
                                
                                playerPaid.balance -= money
                                playerReceived.balance += money
                            }
                        }
                    }
                }
            }
        }
        if !selectPay || !selectRec {
                       playerInvalid()
                       return;
       }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        print(#function)
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func valueInvalid(_ value: String?) {
        var msg = "";
        if value != nil && !(value?.isEmpty ?? true) {
            msg = K.GAME_TEXT.ALERT_MSG_INVALID_TRANSACTION_VALUE.replacingOccurrences(of: "?1", with: value!, options: .literal, range: nil)
        } else {
            msg = K.GAME_TEXT.ALERT_MSG_EMPTY_INVALID_TRANSACTION_VALUE
        }
        let alert = UIAlertController(title: K.GAME_TEXT.ALERT_TITLE_INVALID_VALUE,
                                      message: msg,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: K.GAME_TEXT.ALERT_ACTION_OK, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    fileprivate func playerInvalid() {
        let alert = UIAlertController(title: K.GAME_TEXT.ALERT_TITLE_SELECT_PLAYER,
                                      message: K.GAME_TEXT.ALERT_MSG_SELECT_PLAYER,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: K.GAME_TEXT.ALERT_ACTION_OK, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    fileprivate func searchPlayerByName(_ name: String?, _ value: Double) -> Player? {
        if K.GAME_TEXT.BANK_NAME == name {
            let banck = Player()
            banck.name = K.GAME_TEXT.BANK_NAME
            banck.balance = value
            return banck
        }
        
        if let players = game?.players {
            for player in players {
                if name != nil && player.name == name {
                    return player
                }
            }
        }
        return nil;
    }
    
    fileprivate func alertFunds(_ player: Player) {
        let msg = K.GAME_TEXT.ALERT_MSG_INSUFFICIENT_FUNDS.replacingOccurrences(of: "?1", with: player.name, options: .literal, range: nil)
        let alert = UIAlertController(title: K.GAME_TEXT.ALERT_TITLE_INSUFFICIENT_FUNDS,
                                             message: msg,
                                             preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: K.GAME_TEXT.ALERT_ACTION_OK, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

//MARK: - TABLE DATASOURCE
extension TransactionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let amount = self.game?.players.count ?? 0;
        
        return amount + 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.TRANSACTION_PLAYER_ID,
                                                 for: indexPath) as! TransactionPlayerViewCell
        let amount = self.game?.players.count ?? 0;
        if amount == indexPath.row {
            cell.playerColor.isHidden = true
            cell.banckImg.isHidden = false
            cell.playerName.text = K.GAME_TEXT.BANK_NAME
            cell.playerBalance.text = ""
            cell.checkBox.isChecked = false
        } else if let player = game?.players[indexPath.row] {
            cell.playerColor.backgroundColor = UIColor(hexString: player.color)
            cell.playerName.text = player.name
            cell.playerBalance.text = formatToCurrency(value: player.balance)
            cell.checkBox.isChecked = false
        }
        
        return cell
    }
    
    
}

//MARK: - TABLE DELEGATE
extension TransactionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         if tableView.restorationIdentifier == K.TABLE_ID.TRANSACTION_TABLE_PAY_ID {
            return K.GAME_TEXT.TABLE_HEADER_TRANSACTION_PAY
        }
        
        if tableView.restorationIdentifier == K.TABLE_ID.TRANSACTION_TABLE_RECEIVE_ID {
            return K.GAME_TEXT.TABLE_HEADER_TRANSACTION_RECEIVE
        }
        
        return "";
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = UIColor(named: K.ASSETS_NAME.COLOR_RED)
            headerView.textLabel?.textColor = UIColor(named: K.ASSETS_NAME.COLOR_LIGHT_GRAY)
        }
    }
}
