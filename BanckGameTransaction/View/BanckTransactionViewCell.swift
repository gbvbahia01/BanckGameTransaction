//
//  BanckTransactionViewCell.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 18/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class BanckTransactionViewCell: UITableViewCell {

    
    @IBOutlet weak var colorPlayerPaid: UIView!
    @IBOutlet weak var namePlayerPaid: UILabel!
        
    @IBOutlet weak var colorPlayerReceived: UIView!
    @IBOutlet weak var namePlayerReceived: UILabel!
    
    @IBOutlet weak var valueTransaction: UILabel!
    
    @IBOutlet weak var bankImgPaid: UIImageView!
    @IBOutlet weak var banckImgReceived: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
