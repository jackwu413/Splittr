//
//  ItemCellTableViewCell.swift
//  Splittr
//
//  Created by Jack on 3/15/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class ItemHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("Item header awoke from nib")
    }
    @IBAction func deletePressed(_ sender: UIButton) {
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    @IBAction func removeButtonPressed(_ sender: UIButton) {
    }
    
}
