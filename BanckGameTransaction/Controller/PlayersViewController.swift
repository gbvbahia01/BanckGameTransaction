//
//  PlayersViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 13/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class PlayersViewController: ViewController {
    
    
    @IBOutlet weak var blackColorView: UIView!
    @IBOutlet weak var blackNameLabel: UITextField!
    @IBOutlet weak var blackSwitch: UISwitch!

    @IBOutlet weak var blueColorView: UIView!
    @IBOutlet weak var blueNameLabel: UITextField!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redColorView: UIView!
    @IBOutlet weak var redNameLabel: UITextField!
    @IBOutlet weak var redSwitch: UISwitch!
    
    @IBOutlet weak var yellowColorView: UIView!
    @IBOutlet weak var yellowNameLabel: UITextField!
    @IBOutlet weak var yellowSwitch: UISwitch!
    
    @IBOutlet weak var whiteColorView: UIView!
    @IBOutlet weak var whiteNameLabel: UITextField!
    @IBOutlet weak var whiteSwitch: UISwitch!

    @IBOutlet weak var greenColorView: UIView!
    @IBOutlet weak var greenNameLabel: UITextField!
    @IBOutlet weak var greenSwitch: UISwitch!
    
    var controll = [PlayersControll]()
    var game = GamePlaying()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigation = true
        
        apendViewControll()
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if K.SEGUE.TO_MONEY_PAGE == segue.identifier {
            let destinatonVC = segue.destination as! StartMoneyViewController;
            destinatonVC.game = game;
        }
    }
    
    
    @IBAction func startValueTapped(_ sender: UIButton) {
        game.players.removeAll()
        for pc in controll {
            if pc.sw.isOn {
                if pc.nameLabel.text == nil || pc.nameLabel.text == "" {
                    nameInvalid(pc)
                    return
                }
                let player = Player()
                player.color = pc.colorView.backgroundColor?.hexString ?? "FF00FF"
                player.name = pc.nameLabel.text!
                game.players.append(player)
            }
        }
        performSegue(withIdentifier: K.SEGUE.TO_MONEY_PAGE, sender: self)
    }
   
    fileprivate func nameInvalid(_ player: PlayersControll) {
        let msg = K.GAME_TEXT.ALERT_MSG_INVALID_NAME.replacingOccurrences(of: "?1", with: player.color, options: .literal, range: nil)
        let alert = UIAlertController(title: K.GAME_TEXT.ALERT_TITLE_INVALID_NAME,
                                      message: msg,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: K.GAME_TEXT.ALERT_ACTION_OK, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
   fileprivate func apendViewControll() {
    controll.append(PlayersControll(color: blackColorView, name: blackNameLabel, sw: blackSwitch, colorName: K.GAME_TEXT.COLOR_NAME_BLACK))
       controll.append(PlayersControll(color: blueColorView, name: blueNameLabel, sw: blueSwitch, colorName: K.GAME_TEXT.COLOR_NAME_BLUE))
       controll.append(PlayersControll(color: redColorView, name: redNameLabel, sw: redSwitch, colorName: K.GAME_TEXT.COLOR_NAME_RED))
       controll.append(PlayersControll(color: yellowColorView, name: yellowNameLabel, sw: yellowSwitch, colorName: K.GAME_TEXT.COLOR_NAME_YELLOW))
       controll.append(PlayersControll(color: whiteColorView, name: whiteNameLabel, sw: whiteSwitch, colorName: K.GAME_TEXT.COLOR_NAME_WHITE))
       controll.append(PlayersControll(color: greenColorView, name: greenNameLabel, sw: greenSwitch, colorName: K.GAME_TEXT.COLOR_NAME_GREEN))
   }
}

class PlayersControll {
    
    var colorView: UIView
    var nameLabel: UITextField
    var sw: UISwitch
    var color: String
    
    init(color: UIView, name: UITextField, sw: UISwitch, colorName: String) {
        self.colorView = color
        self.nameLabel = name
        self.sw = sw
        self.color = colorName
    }
}
