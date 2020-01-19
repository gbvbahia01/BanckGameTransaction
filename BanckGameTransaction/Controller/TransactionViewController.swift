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
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if K.SEGUE.BACK_TRANSACTION_PAGE == segue.identifier {
        }
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.BACK_TRANSACTION_PAGE,
                     sender: self)

    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.BACK_TRANSACTION_PAGE,
                     sender: self)
    }
    
}


//MARK: - TABLE DATASOURCE
extension TransactionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var amount = 0;
        
        if tableView.restorationIdentifier == K.TABLE_ID.TRANSACTION_TABLE_PAY_ID {
            amount = 3
        }
        
        if tableView.restorationIdentifier == K.TABLE_ID.TRANSACTION_TABLE_RECEIVE_ID {
            amount = 3
        }
        
        return amount;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.TRANSACTION_PLAYER_ID,
                                                 for: indexPath) as! TransactionPlayerViewCell
        
        cell.playerColor.backgroundColor = .black
        cell.playerName.text = "Player Name"
        cell.playerBalance.text = "2.000.000,00"
        cell.checkBox.isChecked = false
        
        if tableView.restorationIdentifier == K.TABLE_ID.TRANSACTION_TABLE_PAY_ID {
        }
        
        if tableView.restorationIdentifier == K.TABLE_ID.TRANSACTION_TABLE_RECEIVE_ID {
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
