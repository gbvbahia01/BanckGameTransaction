//
//  PlayersViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 13/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class PlayersViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigation = true
    }
    
    //MARK: - SEGUE CALL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if K.SEGUE.TO_MONEY_PAGE == segue.identifier {
            // TODO check if at least two players were selected
        }
    }
    
    
    @IBAction func startValueTapped(_ sender: UIButton) {
        print(#function)
                performSegue(withIdentifier: K.SEGUE.TO_MONEY_PAGE,
                             sender: self)
    }
   
   
}
