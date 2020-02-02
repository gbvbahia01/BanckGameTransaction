//
//  ViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 13/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class StartAppViewController: ViewController {
    
    var gamePlayng: GamePlaying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigation = true
        gamePlayng = GamePlaying()
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(#function)
        if K.SEGUE.TO_PLAYERS_PAGE == segue.identifier {
            // TODO check if is a old game not finished
            // If have, show a alert asking the user.
        }
    }
    
    @IBAction func newGameTapped(_ sender: UIButton) {
        //print(#function)
        performSegue(withIdentifier: K.SEGUE.TO_PLAYERS_PAGE,
                     sender: self)
    }
    
}

