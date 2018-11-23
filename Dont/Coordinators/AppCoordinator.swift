//
//  AppCoordinator.swift
//  Dont
//
//  Created by Adam Smaka on 11/23/18.
//  Copyright © 2018 Adam Smaka. All rights reserved.
//

import UIKit


final class AppCoordinator: NSObject, Coordinator {
    let window: UIWindow
    let rootNavigationController: UINavigationController
    //var childCoordinators: [Coordinator] = []
    let mapCoordinator: Coordinator
    
    init(window: UIWindow) {
        self.window = window
        rootNavigationController = UINavigationController()
        rootNavigationController.isNavigationBarHidden = true
        let vc = ViewController()
        rootNavigationController.pushViewController(vc, animated: false)
        mapCoordinator = MapCoordinator(presenter: rootNavigationController)
        super.init()
    }
    
    private func configureNavigationController() -> UINavigationController {
        let nc = UINavigationController()
        nc.isNavigationBarHidden = true
        return nc
    }
    
    func start() {
        window.rootViewController = rootNavigationController
        mapCoordinator.start()
        window.makeKeyAndVisible()
    }
}
