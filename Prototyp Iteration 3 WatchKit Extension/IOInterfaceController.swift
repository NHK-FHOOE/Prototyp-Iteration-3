//
//  IOInterfaceController.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 16.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import Foundation
import WatchKit

class IOInterfaceController: WKInterfaceController {
    
    // Alt - Label Test
    // @IBOutlet weak var detailLabel: WKInterfaceLabel!
    @IBOutlet weak var tableView: WKInterfaceTable!
    let tableData = ["1", "2", "3", "4", "5", "6"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //Nimm die Daten, die übergeben wurden und schreibe sie auf detailLabel
        /* Alt - Label Test
         if let detailData = context as? String {
         detailLabel.setText(detailData)
         }*/
        if let detailData = context as? String {
            loadTableData(detailData: detailData)
        }
    }
    override func willActivate() {
        super.willActivate()
    }
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    private func loadTableData(detailData: String){
        tableView.setNumberOfRows(tableData.count, withRowType: "RowController")
        for (index, rowModel) in tableData.enumerated() {
            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.rowLabel.setText(detailData+"."+rowModel)
            }
        }
    }
}

