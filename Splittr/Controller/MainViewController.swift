//
//  ViewController.swift
//  Splittr
//
//  Created by Jack on 2/26/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func scanPressed(_ sender: UIButton) {
    }
    @IBAction func enterPressed(_ sender: UIButton) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {
            fatalError("Navigation Controller does not exist")
        }
        navBar.shadowImage = UIImage()
        navBar.barTintColor = #colorLiteral(red: 0.6432265639, green: 0.9184823632, blue: 0.7707243562, alpha: 1)
        scanButton.layer.cornerRadius = 7
        enterButton.layer.cornerRadius = 7
    }
}

