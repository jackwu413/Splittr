//
//  ResultsTableViewController.swift
//  Splittr
//
//  Created by Jack on 3/17/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit
import RealmSwift

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    var payments: [String: Float]?
    var items: [Item]?
    var keys: [String] = []
    var itemList: [String:[String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Result Cell")
        keys = Array(payments!.keys)
        getItemList()
        tableView.reloadData()
    }
    
    func getItemList() {
        itemList = [:]
        for buyer in keys {
            for item in items! {
                if item.buyers.contains(buyer) {
                    if itemList![buyer] == nil {
                        itemList![buyer] = [item.name]
                    } else {
                        itemList![buyer]?.append(item.name)
                    }
                }
            }
        }
        print(itemList)
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        //Persist Data to realm
//        do {
//            try realm.write {
//                realm.add(items!)
//            }
//        } catch {
//            print("Error saving context, \(error)")
//        }
        //Navigate back to home screen
    }
    
}

extension ResultsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return payments!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = keys[section]
        let amount = String(format: "%.2f", payments![person]!)
        return "\(person): $\(amount)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("Rows: \(payments!.count)")
//        return payments!.count
        let person = keys[section]
        return itemList![person]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Result Cell", for: indexPath)
        let person = keys[indexPath.section ]
        let item = itemList![person]![indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}
