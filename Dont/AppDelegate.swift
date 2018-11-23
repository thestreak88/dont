//
//  AppDelegate.swift
//  Dont
//
//  Created by Adam Smaka on 11/23/18.
//  Copyright © 2018 Adam Smaka. All rights reserved.
//
// CTRL + CMD + E = Edit All in Scope
//
/*
 // Internationalizing
 let period: Int = 2
 let quantity: String = NumberFormatter.localizedString(from: 1000, number: .decimal)
 let formatString = NSLocalizedString("You have sold %@ apps in %d months", comment: "Time taken to sell 1000 apps")
 label.text = String.localizedStringWithFormat(formatString, quantity, period)
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let isTesting = NSClassFromString("XCTest") != nil
    private var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if !isTesting {
            start()
        }
        return true
    }
    
    private func start() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)
        self.window = window
        self.appCoordinator = appCoordinator
        appCoordinator.start()
    }
}

