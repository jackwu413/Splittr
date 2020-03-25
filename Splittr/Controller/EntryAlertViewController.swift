//
//  EntryAlertViewController.swift
//  Splittr
//
//  Created by Jack on 3/19/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class EntryAlertViewController: UIViewController {

    //Fields/Table
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //Visual Components
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var splitItemButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var warningView: UIView!
    
    //Used Objects/Variables
    var potentialBuyers: [String] = []
    var item: Item?
    
    //Delegates
    var alertDelegate: AlertDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        potentialBuyers.append("")
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BuyerCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setCornerRadius()
        warningView.isHidden = true
    }
    
    func setCornerRadius() {
        mainView.layer.cornerRadius = 5
        titleView.layer.cornerRadius = 5
        splitItemButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        addItemButton.layer.cornerRadius = 5
        warningView.layer.cornerRadius = 5
    }
    
    @IBAction func splitItemPressed(_ sender: UIButton) {
        //print("Split Item Pressed")
        potentialBuyers.append("")
        tableView.reloadData()
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addItemPressed(_ sender: UIButton) {
        //print("add Item Pressed")
        
        if verifyFields() && verifyTable() {
            //create item using field values
            createItem()
            //dismiss(animated: true)
        } else {
            //reveal warning view
            self.warningView.isHidden = false
        }

    }
    
    func createItem() {
        var buyers: [String] = []
        let cells = tableView.visibleCells as! [BuyerCell]
        for cell in cells {
            buyers.append(cell.nameField.text!)
        }
        let name: String = itemField.text!
        let price: Float = Float(priceField.text!)!
        let newItem = Item(name: name, price: price, buyers: buyers)
        self.item = newItem
        print("creating new item object")
        if let delegate = self.alertDelegate {
            delegate.insertItem(item: newItem)
        }
        dismiss(animated: true)
    }
    
    func verifyFields() -> Bool {
        if let name = itemField.text, let price = priceField.text {
            if name == "" || price == "" {
                return false
            }
        }
        return true
    }
    
    func verifyTable() -> Bool {
        let cells = tableView.visibleCells as! [BuyerCell]
        for cell in cells {
            if let bName = cell.nameField.text {
                if bName == "" {
                    return false
                }
            }
        }
        return true
    }
    
}

extension EntryAlertViewController: UITableViewDataSource, DeleteButtonDelegate, BuyersDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(potentialBuyers.count)
        return potentialBuyers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! BuyerCell
        cell.deleteButtonDelegate = self
        cell.buyersDelegate = self
        cell.indexPath = indexPath
        cell.nameField.text = self.potentialBuyers[indexPath.row]
        if potentialBuyers.count == 1 {
            cell.deleteButton.isHidden = true
        } else {
            cell.deleteButton.isHidden = false
        }
        return cell
    }
    
    
    func deletePressed(indexPath: IndexPath) {
        potentialBuyers.remove(at: indexPath.row)
        tableView.reloadData()
        print(potentialBuyers)
    }

    func addPotentialBuyer(position: Int, name: String) {
        print("Adding \(name) at position \(position)")
        potentialBuyers[position] = name
        print(potentialBuyers)
    }

}
