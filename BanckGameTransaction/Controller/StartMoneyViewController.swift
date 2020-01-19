//
//  StartMoneyViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 15/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class StartMoneyViewController: ViewController {
    
    @IBOutlet weak var playersSelectedTable: UITableView!
    @IBOutlet weak var startMoneyField: CurrencyField!
    
    var game: GamePlaying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigation = true
        
        super.registerCell(with: playersSelectedTable,
                           nibFile: K.TABLE_CELL.PLAYER_SELECTED_NIB,
                           cellId: K.TABLE_CELL.PLAYER_SELECTED_ID)
        playersSelectedTable.delegate = self
        playersSelectedTable.dataSource = self
        
        startMoneyField.locale = locale
    }
    
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if K.SEGUE.TO_GAME_PAGE == segue.identifier {
            let destinatonVC = segue.destination as! GameViewController;
            destinatonVC.game = game;
        }
    }
    
    @IBAction func startGameTapped(_ sender: UIButton) {
         let money = (startMoneyField.decimal as NSDecimalNumber).doubleValue
            if (money <= 0) {
                valueInvalid(String(money))
                return
            }
            if let players = game?.players {
               for player in players {
                   player.balance = money
               }
            }
       
        performSegue(withIdentifier: K.SEGUE.TO_GAME_PAGE, sender: self)
    }
    
    fileprivate func valueInvalid(_ value: String?) {
        var msg = "";
        if value != nil && !(value?.isEmpty ?? true) {
            msg = K.GAME_TEXT.ALERT_MSG_INVALID_VALUE.replacingOccurrences(of: "?1", with: value!, options: .literal, range: nil)
        } else {
            msg = K.GAME_TEXT.ALERT_MSG_EMPTY_INVALID_VALUE
        }
        let alert = UIAlertController(title: K.GAME_TEXT.ALERT_TITLE_INVALID_VALUE,
                                      message: msg,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: K.GAME_TEXT.ALERT_ACTION_OK, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func backToPlayersTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - TABLE DATASOURCE
extension StartMoneyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let amount = self.game?.players.count ?? 0;
        return amount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.PLAYER_SELECTED_ID,
                                                 for: indexPath) as! PlayerSelectedViewCell
        
        if let player = game?.players[indexPath.row] {
            
            cell.colorView.backgroundColor = UIColor(hexString: player.color)
            cell.playerNameLabel.text = player.name
            return cell
        }
        return UITableViewCell()
    }
}




//MARK: - TABLE DELEGATE
extension StartMoneyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return K.GAME_TEXT.TABLE_HEADER_PLAYERS
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = UIColor(named: K.ASSETS_NAME.COLOR_RED)
            headerView.textLabel?.textColor = UIColor(named: K.ASSETS_NAME.COLOR_LIGHT_GRAY)
        }
    }
}
