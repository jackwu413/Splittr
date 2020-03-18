//
//  AdjustmentsViewController.swift
//  Splittr
//
//  Created by Jack on 3/16/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class AdjustmentsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var tipSlider: UISlider!

    //MARK: - Commonly Used Vars
    var itemTotal: Float = 0.0
    var tax: Float = 0.07
    var tip: Float = 0.15
    var items: [Item]?
    var payments: [String:Float] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTotal = getItemTotal(items: items!)
        setTotalLabel()
    }
    
    
    @IBAction func taxSliderChanged(_ sender: UISlider) {
        taxLabel.text = "\(String(format: "%.0f", sender.value))%"
        tax = Float(String(format: "%.2f", sender.value/100))!
        setTotalLabel()
    }
    
    @IBAction func tipSliderChanged(_ sender: UISlider) {
        tipLabel.text = "\(String(format: "%.0f", sender.value))%"
        tip = Float(String(format: "%.2f", sender.value/100))!
        setTotalLabel()
    }
    
    
    @IBAction func splitPressed(_ sender: UIButton) {
        calculatePayments()
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            print("payments size on adjustments page: \(payments.count)")
            destinationVC.payments = payments
            destinationVC.items = items
        }
    }
    
    func calculatePayments() {
        payments = [:]
        for item in items! {
            for buyer in item.buyers {
                if payments[buyer] == nil {
                    payments[buyer] = Float(String(format: "%.2f", item.price/Float(item.buyers.count)))
                } else {
                    payments[buyer]! += Float(String(format: "%.2f", item.price/Float(item.buyers.count)))!
                }
            }
        }
        for (name, payment) in payments {
            let afterTax = payment * tax
            let afterTip = (afterTax + payment) * tip
            payments[name]! += afterTax + afterTip
            payments[name] = Float(String(format: "%.2f", payments[name]!))
        }
        print(payments)
    }
    
    func setTotalLabel() {
        totalLabel.text = String(format: "%.2f", (itemTotal*tax)+(((itemTotal*tax)+itemTotal)*tip)+itemTotal)
    }
    
    func getItemTotal(items: [Item]) -> Float {
        var total: Float = 0.0
        for item in items {
            total += Float(String(format: "%.2f", item.price))!
        }
        return total
    }
}
