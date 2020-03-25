//
//  ResultsTableViewController.swift
//  Splittr
//
//  Created by Jack on 3/17/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
//    var payments: [String: Float]?
//    var items: [Item]?
//    var keys: [String] = []
//    var itemList: [String:[String]]?
    var buyers: [Buyer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        //keys = Array(payments!.keys)
        tableView.reloadData()
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        //Persist Data to realm
        //Navigate back to home screen
    }
    
}

extension ResultsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return buyers!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(buyers![section].name) - $\(String(format: "%.2f", buyers![section].amount))"
//        let person = keys[section]
//        let amount = String(format: "%.2f", payments![person]!)
//        return "\(person): $\(amount)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyers![section].items.count
//        print("Rows: \(payments!.count)")
//        return payments!.count
//        let person = keys[section]
//        return itemList![person]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Result Cell", for: indexPath)
        let item = buyers![indexPath.section].items[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}
