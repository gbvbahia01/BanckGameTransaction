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
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated);
          navigationController?.isNavigationBarHidden = hiddenNavigation;
      }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        navigationController?.isNavigationBarHidden = false;
        
    }
    

}
