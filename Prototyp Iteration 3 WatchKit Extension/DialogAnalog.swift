//
//  DialogAnalog.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 25.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import Foundation
import WatchKit

class DialogAnalog: WKInterfaceController{
    
    var singleIOCard = ioCard(langtext: "", status: false, bmk: "", force: false, index: 0, type: "DO")
    
    @IBOutlet weak var valueLabel: WKInterfaceLabel!
    @IBOutlet weak var unitLabel: WKInterfaceLabel!
    @IBOutlet weak var langtextLabel: WKInterfaceLabel!
    @IBOutlet weak var bmkLabel: WKInterfaceLabel!
    
    @IBAction func backButton() {
        pop()
    }
    
    
    override func awake(withContext context: Any?) {
        if let getSingleIOCard = context as? ioCard{
            singleIOCard = getSingleIOCard
            langtextLabel.setText(singleIOCard.langtext)
            bmkLabel.setText(singleIOCard.bmk)
            if getSingleIOCard.type == "DI"{
                if getSingleIOCard.status{
                   valueLabel.setText("Aktiv")
                } else {
                    valueLabel.setText("Inaktiv")
                }
                unitLabel.setText("")
            } else {
                valueLabel.setText("401")
                unitLabel.setText("mm")
            }
        }
    }
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
