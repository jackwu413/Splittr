//
//  AppDelegate.swift
//  Splittr
//
//  Created by Jack on 2/26/20.
//  Copyright © 2020 Jack Wu. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        //print(Realm.Configuration.defaultConfiguration.fileURL)
//        do {
//            _ = try Realm()
//        } catch {
//            print("Error initializing new realm, \(error)")
//        }
        return true
    }


}

