//
//  ItemCellTableViewCell.swift
//  Splittr
//
//  Created by Jack on 3/15/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func removeButtonPressed(_ sender: UIButton) {
    }
    
}
