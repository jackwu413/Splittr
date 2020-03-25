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
    @IBOutlet weak var formatButton: UIBarButtonItem!
    
    
    var buyers: [Buyer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        //keys = Array(payments!.keys)
        tableView.reloadData()
    }
    
    @IBAction func formatPressed(_ sender: UIBarButtonItem) {
        if formatButton.title == "Expand" {
            formatButton.title = "Collapse"
            for i in 0 ... buyers!.count-1 {
                var indexPaths = [IndexPath]()
                for row in buyers![i].items.indices {
                    indexPaths.append(IndexPath(row: row, section: i))
                }
                buyers![i].expanded = true
                tableView.insertRows(at: indexPaths, with: .fade)
            }
        } else {
            formatButton.title = "Expand"
            for i in 0 ... buyers!.count-1 {
                var indexPaths = [IndexPath]()
                for row in buyers![i].items.indices {
                    indexPaths.append(IndexPath(row: row, section: i))
                }
                buyers![i].expanded = false
                tableView.deleteRows(at: indexPaths, with: .fade)
            }
        }
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
        if !buyers![section].expanded {
            return 0
        } else {
            return buyers![section].items.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Result Cell", for: indexPath)
        let item = buyers![indexPath.section].items[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}
