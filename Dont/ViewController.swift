//
//  ViewController.swift
//  Dont
//
//  Created by Adam Smaka on 11/23/18.
//  Copyright © 2018 Adam Smaka. All rights reserved.
//
// UIViewController(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .yellow
        label.text = "Welcome to Don't!"
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        print("You finished!")
    }
}

