//
//  ViewController.swift
//  Prototyp Iteration 3
//
//  Created by Niels-Hendrik Klopsch on 15.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var intLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var defaults = UserDefaults(suiteName: "group.TestCompany.Prototyp-Iteration-3")
        var intPassed = defaults!.integer(forKey: "passingInt")
        intLabel.text = "\(intPassed)"
    }


}

