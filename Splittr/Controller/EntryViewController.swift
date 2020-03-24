//
//  EntryViewController.swift
//  Splittr
//
//  Created by Jack on 3/15/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

protocol AlertDelegate {
    func insertItem(item: Item)
}

class EntryViewController: UIViewController, AlertDelegate {
    
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
        tableView.delegate = self
        tableView.register(UINib(nibName: "ItemHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        doneButton.layer.cornerRadius = 7
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        let alertVC = entryAlertService.alert()
        alertVC.alertDelegate = self
        present(alertVC, animated: true)
    }
    
    func insertItem(item: Item) {
        print("inserting new item")
        self.items.append(item)
        self.tableView.reloadData()
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

extension EntryViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "\(items[section].name) - $\(items[section].price)"
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! ItemHeaderView
        headerView.nameLabel.text = items[section].name
        headerView.priceLabel.text = String(format: "%.2f", items[section].price)
        return headerView
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
