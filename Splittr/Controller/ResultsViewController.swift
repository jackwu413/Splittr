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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Result Cell")
        keys = Array(payments!.keys)
        tableView.reloadData()
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Result Cell", for: indexPath)
        let person = keys[indexPath.row]
        let amount = String(format: "%.2f", payments![person]!)
        cell.textLabel?.text = "\(person): $\(amount)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Rows: \(payments!.count)")
        return payments!.count
    }
}
