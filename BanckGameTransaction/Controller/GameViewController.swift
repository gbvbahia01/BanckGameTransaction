//
//  GameViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 18/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit


class GameViewController: ViewController {
    
    @IBOutlet weak var balancePlayerTable: UITableView!
    @IBOutlet weak var transactionPlayerTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenNavigation = true
        
        balancePlayerTable.register(UINib(nibName: K.TABLE_CELL.BANCK_BALANCE_NIB,
                                          bundle: nil),
                                    forCellReuseIdentifier: K.TABLE_CELL.BANCK_BALANCE_ID)
        balancePlayerTable.dataSource = self
        balancePlayerTable.delegate = self
        
        transactionPlayerTable.register(UINib(nibName: K.TABLE_CELL.BANCK_TRANSACTION_NIB,
                                          bundle: nil),
                                    forCellReuseIdentifier: K.TABLE_CELL.BANCK_TRANSACTION_ID)
        transactionPlayerTable.dataSource = self
        transactionPlayerTable.delegate = self
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if K.SEGUE.TO_TRANSACTION_PAGE == segue.identifier {
            // TODO check if at least two players were selected
        }
    }
    //startGameTapped
    @IBAction func transactionTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.TO_TRANSACTION_PAGE,
                     sender: self)
    }
    
}

//MARK: - TABLE DATASOURCE
extension GameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var amount = 0;
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANCK_BALANCE_ID {
            amount = 6
        }
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANCK_TRANSACTION_ID {
            amount = 10
        }
        
        return amount;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANCK_BALANCE_ID {
                   let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.BANCK_BALANCE_ID,
                                                            for: indexPath) as! BanckBalanceViewCell
                   
                   cell.viewColor.backgroundColor = UIColor(named: K.ASSETS_NAME.COLOR_LIGHT_GRAY)
                   cell.playerNameLabel.text = "Player Name"
                   cell.playerBalanceLabel.text = "2.000.000,00"
                   return cell
       }
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANCK_TRANSACTION_ID {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.BANCK_TRANSACTION_ID,
                                                    for: indexPath) as! BanckTransactionViewCell
            cell.colorPlayerPaid.backgroundColor = UIColor.black
            cell.namePlayerPaid.text = "Player Paid Name"
            
            cell.colorPlayerReceived.backgroundColor = UIColor.blue
            cell.namePlayerReceived.text = "Player Received Name"
            
            cell.valueTransaction.text = "3.000.000,00"
            return cell
        }
        return UITableViewCell()
    }
    
    
}

//MARK: - TABLE DELEGATE
extension GameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         if tableView.restorationIdentifier == K.TABLE_ID.BANCK_BALANCE_ID {
            return K.GAME_TEXT.TABLE_HEADER_BALANCE
        }
        
        if tableView.restorationIdentifier == K.TABLE_ID.BANCK_TRANSACTION_ID {
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
