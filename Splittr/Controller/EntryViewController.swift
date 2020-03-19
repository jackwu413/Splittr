//
//  EntryViewController.swift
//  Splittr
//
//  Created by Jack on 3/15/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    //Commonly Used Items
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    
    var items: [Item] = []
    
    //Alert Service
    let entryAlertService = EntryAlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        doneButton.layer.cornerRadius = 7
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        let alertVC = entryAlertService.alert()
        present(alertVC, animated: true)
//        var nameTextField = UITextField()
//        var priceTextField = UITextField()
//        var buyersTextField = UITextField()
//
//        let alert = UIAlertController(title: "Add Item", message: "Comma separate if >1 buyer", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Add", style: .default) { (action) in
//            let newItem = Item(
//                name: nameTextField.text!,
//                price: (priceTextField.text! as NSString).floatValue,
//                buyers: self.getBuyers(from: buyersTextField.text!)
//            )
//            self.items.append(newItem)
//            self.tableView.reloadData()
//        }
//
//        alert.addTextField { (field) in
//            field.placeholder = "Item Name"
//            nameTextField = field
//        }
//        alert.addTextField { (field) in
//            field.placeholder = "Price"
//            priceTextField = field
//        }
//        alert.addTextField { (field) in
//            field.placeholder = "Buyer(s)"
//            buyersTextField = field
//        }
//
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
    }
    
    func getBuyers(from buyers: String) -> [String]{
        //MIGHT HAVE TO MODIFY SEPARATOR TO NOT USE SPACE
        return buyers.components(separatedBy: ", ")
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAdjustments", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAdjustments" {
            let destinationVC = segue.destination as! AdjustmentsViewController
            destinationVC.items = items
        }
    }
    
    
}

extension EntryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(items[section].name) - $\(items[section].price)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].buyers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item Cell", for: indexPath)
        let item = items[indexPath.section]
        let buyer = item.buyers[indexPath.row]
        cell.textLabel?.text = buyer
        return cell
    }
    
    
}
