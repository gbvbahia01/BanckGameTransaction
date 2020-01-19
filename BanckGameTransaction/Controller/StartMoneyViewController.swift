//
//  StartMoneyViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 15/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class StartMoneyViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigation = true
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if K.SEGUE.TO_GAME_PAGE == segue.identifier {
            // TODO check if at least two players were selected
        }
    }
    
    
    @IBAction func startGameTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: K.SEGUE.TO_GAME_PAGE,
                     sender: self)
    }
    
    
}
