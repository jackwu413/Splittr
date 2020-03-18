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
    var payments: [String: Float]?
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
