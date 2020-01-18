//
//  BanckBalanceViewCell.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 18/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class BanckBalanceViewCell: UITableViewCell {

    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerBalanceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
