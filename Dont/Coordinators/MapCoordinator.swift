//
//  MapCoordinator.swift
//  Dont
//
//  Created by Adam Smaka on 11/23/18.
//  Copyright © 2018 Adam Smaka. All rights reserved.
//

import UIKit

final class MapCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var mapViewController: ViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let mapViewController = ViewController(nibName: nil, bundle: nil)
        mapViewController.title = "Kanji list"
        presenter.pushViewController(mapViewController, animated: true)
        self.mapViewController = mapViewController
    }
}
