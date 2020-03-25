//
//  Buyer.swift
//  Splittr
//
//  Created by Jack on 3/24/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import Foundation

class Buyer {
    var expanded: Bool
    var name: String
    var amount: Float
    var items: [String]
    
    init(expanded: Bool, name: String, amount: Float, items: [String]) {
        self.expanded = expanded
        self.name = name
        self.amount = amount
        self.items = items
    }
}
