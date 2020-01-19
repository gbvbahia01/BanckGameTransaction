//
//  TransactionPlayerViewCell.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 18/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit
import CheckBox

class TransactionPlayerViewCell: UITableViewCell {

    @IBOutlet weak var playerColor: UIView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerBalance: UILabel!
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var banckImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBox.cornerRadius = 7;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
