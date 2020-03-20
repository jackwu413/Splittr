//
//  EntryAlertService.swift
//  Splittr
//
//  Created by Jack on 3/19/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class EntryAlertService {
    func alert() -> EntryAlertViewController {
        let storyboard = UIStoryboard(name: "EntryAlert", bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "EntryAlertVC") as! EntryAlertViewController
        return alertVC
    }
}
