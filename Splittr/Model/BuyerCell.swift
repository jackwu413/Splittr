//
//  BuyerCell.swift
//  Splittr
//
//  Created by Jack on 3/19/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

protocol DeleteButtonDelegate {
//    func deletePressed(index: Int)
    func deletePressed(indexPath: IndexPath)
}

protocol BuyersDelegate {
    func addPotentialBuyer(position: Int, name: String)
}

class BuyerCell: UITableViewCell {

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    
    var deleteButtonDelegate: DeleteButtonDelegate!
    var buyersDelegate: BuyersDelegate!
    var indexPath: IndexPath!
    var buyerName: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameField.delegate = self
    }

    @IBAction func deletePressed(_ sender: UIButton) {
        self.deleteButtonDelegate?.deletePressed(indexPath: indexPath)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BuyerCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.buyersDelegate.addPotentialBuyer(position: indexPath.row, name: nameField.text!)
    }
    
}
