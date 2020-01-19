//
//  EndGameViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 18/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class EndGameViewController: ViewController {
    
    @IBOutlet weak var winnerName: UILabel!
    @IBOutlet weak var playersResultTable: UITableView!
    
    var game: GamePlaying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenNavigation = true
        
        registerCell(with: playersResultTable,
                     nibFile: K.TABLE_CELL.BANK_BALANCE_NIB,
                     cellId: K.TABLE_CELL.BANK_BALANCE_ID)
        playersResultTable.dataSource = self
        playersResultTable.delegate = self
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let player = game?.players[0] {
            winnerName.text = player.name
        }
    }
    
    @IBAction func finishTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.BACK_START_PAGE,
                     sender: self)
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if K.SEGUE.BACK_START_PAGE == segue.identifier {
        }
    }
}

//MARK: - TABLE DATASOURCE
extension EndGameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let amount = self.game?.players.count ?? 0;
        
        return amount;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_CELL.BANK_BALANCE_ID,
                                                for: indexPath) as! BanckBalanceViewCell
        if let player = game?.players[indexPath.row] {
                cell.viewColor.backgroundColor = UIColor(hexString: player.color)
                cell.playerNameLabel.text = player.name
                cell.playerBalanceLabel.text = formatToCurrency(value: player.balance)
        }
       
       return cell
        
    }
    
    
}

//MARK: - TABLE DELEGATE
extension EndGameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return K.GAME_TEXT.TABLE_HEADER_BALANCE;
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = UIColor(named: K.ASSETS_NAME.COLOR_BLUE)
            headerView.textLabel?.textColor = UIColor(named: K.ASSETS_NAME.COLOR_LIGHT_GRAY)
        }
    }
}
