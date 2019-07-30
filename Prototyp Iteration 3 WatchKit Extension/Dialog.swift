//
//  Dialog.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 20.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import Foundation
import WatchKit

class Dialog: WKInterfaceController {
    
    var singleIOCard = ioCard(langtext: "", status: false, bmk: "", force: false, index: 0, type: "DO")
    
    @IBOutlet weak var message: WKInterfaceLabel!
    @IBOutlet weak var statusBtn: WKInterfaceButton!
    @IBOutlet weak var cancelBtn: WKInterfaceButton!
    
    @IBAction func didPressStatusBtn() {
        singleIOCard.force = !singleIOCard.force
        singleIOCard.status = !singleIOCard.status
        tableData[singleIOCard.index] = singleIOCard
        pop()
    }
    
    @IBAction func didPressCancelBtn() {
        pop()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let getSingleIOCard = context as? ioCard{
            singleIOCard = getSingleIOCard
            message.setText(singleIOCard.langtext)
        }
        if singleIOCard.status {
            statusBtn.setTitle("Deaktivieren")
        } else {
            statusBtn.setTitle("Aktivieren")
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
