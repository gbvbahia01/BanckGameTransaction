//
//  GameViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 18/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit
import RealmSwift

class GameViewController: ViewController {
    
    @IBOutlet weak var balancePlayerTable: UITableView!
    @IBOutlet weak var transactionPlayerTable: UITableView!
    
    var game: GamePlaying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        hiddenNavigation = true
        
        registerCell(with: balancePlayerTable,
                     nibFile: K.TABLE_CELL.BANK_BALANCE_NIB,
                     cellId: K.TABLE_CELL.BANK_BALANCE_ID)
        balancePlayerTable.dataSource = self
        balancePlayerTable.delegate = self
        
        registerCell(with: transactionPlayerTable,
                     nibFile: K.TABLE_CELL.BANK_TRANSACTION_NIB,
                     cellId: K.TABLE_CELL.BANK_TRANSACTION_ID)
        transactionPlayerTable.dataSource = self
        transactionPlayerTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sortPlayers()
        balancePlayerTable.reloadData()
        transactionPlayerTable.reloadData()
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if K.SEGUE.TO_TRANSACTION_PAGE == segue.identifier {
            let destinatonVC = segue.destination as! TransactionViewController;
            destinatonVC.game = game;
        }
        
        if K.SEGUE.TO_ENDGAME_PAGE == segue.identifier {
            let destinatonVC = segue.destination as! EndGameViewController;
            destinatonVC.game = game;
        }
    }

    @IBAction func transactionTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.TO_TRANSACTION_PAGE,
                     sender: self)
    }
    
    @IBAction func endGameTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.TO_ENDGAME_PAGE,
                     sender: self)
    }
    
    fileprivate func sortPlayers() {
        if var players = game?.players {
            players.sort {
                $0.balance > $1.balance
            }
        }
        
    }
}

//MARK: - TABLE DATASOURCE
extension GameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var amount = 0;
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANK_BALANCE_ID {
             amount = self.game?.players.count ?? 0;
        }
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANK_TRANSACTION_ID {
            amount = self.game?.transactions.count ?? 0;
        }
        
        return amount;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANK_BALANCE_ID {
                   let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.BANK_BALANCE_ID,
                                                            for: indexPath) as! BanckBalanceViewCell
                    if let player = game?.players[indexPath.row] {
                   cell.viewColor.backgroundColor = UIColor(hexString: player.color)
                        cell.playerNameLabel.text = player.name
                        cell.playerBalanceLabel.text = formatToCurrency(value: player.balance)
                   return cell
            }
       }
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANK_TRANSACTION_ID {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.BANK_TRANSACTION_ID,
                                                    for: indexPath) as! BanckTransactionViewCell
            if let transaction = game?.transactions[indexPath.row] {
                if transaction.namePaid == K.GAME_TEXT.BANK_NAME {
                    cell.colorPlayerPaid.backgroundColor = UIColor(hexString: K.ASSETS_NAME.MISS_COLOR)
                } else {
                    cell.colorPlayerPaid.backgroundColor = UIColor(hexString: transaction.colorPaid)
                }
                cell.namePlayerPaid.text = transaction.namePaid

                if transaction.nameReceived == K.GAME_TEXT.BANK_NAME {
                    cell.colorPlayerReceived.backgroundColor = UIColor(hexString: K.ASSETS_NAME.MISS_COLOR)
                } else {
                    cell.colorPlayerReceived.backgroundColor = UIColor(hexString: transaction.colorReceived)
                }
                cell.namePlayerReceived.text = transaction.nameReceived
                
                cell.valueTransaction.text = formatToCurrency(value: transaction.value)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}

//MARK: - TABLE DELEGATE
extension GameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         if tableView.restorationIdentifier == K.TABLE_ID.BANK_BALANCE_ID {
            return K.GAME_TEXT.TABLE_HEADER_BALANCE
        }
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANK_TRANSACTION_ID {
            return K.GAME_TEXT.TABLE_HEADER_TRANSACTIONS
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
