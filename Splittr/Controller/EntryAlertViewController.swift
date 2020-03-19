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
    @IBOutlet weak var buyerTable: UITableView!
    
    //Used Objects/Variables
    var potentialBuyers: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        potentialBuyers.append("Mandatory First Buyer")
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BuyerCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainView.layer.cornerRadius = 5
        titleView.layer.cornerRadius = 5
        splitItemButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        addItemButton.layer.cornerRadius = 5
    }
    
    @IBAction func splitItemPressed(_ sender: UIButton) {
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addItemPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension EntryAlertViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return potentialBuyers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! BuyerCell
        if potentialBuyers.count == 1 {
            cell.deleteButton.isHidden = true
        }
        return cell
    }


}
