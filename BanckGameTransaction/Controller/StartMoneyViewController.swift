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
    
    var game: GamePlaying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigation = true
        
        super.registerCell(with: playersSelectedTable,
                           nibFile: K.TABLE_CELL.PLAYER_SELECTED_NIB,
                           cellId: K.TABLE_CELL.PLAYER_SELECTED_ID)
        playersSelectedTable.delegate = self
        playersSelectedTable.dataSource = self
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if K.SEGUE.TO_GAME_PAGE == segue.identifier {
        }
    }
    
    @IBAction func startGameTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.TO_GAME_PAGE,
                     sender: self)
    }
    
    @IBAction func backToPlayersTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - TABLE DATASOURCE
extension StartMoneyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let amount = self.game?.players.count ?? 0;
        print("Table size \(amount)")
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
