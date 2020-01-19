//
//  ViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 13/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hiddenNavigation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(named: K.ASSETS_NAME.COLOR_RED)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated);
          navigationController?.isNavigationBarHidden = hiddenNavigation;
      }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        navigationController?.isNavigationBarHidden = false;
        
    }
    
    func registerCell(with table: UITableView,
                      nibFile nib: String,
                      cellId id: String) {
        table.register(UINib(nibName: nib,  bundle: nil),
                       forCellReuseIdentifier: id)
    }

}
