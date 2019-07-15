//
//  InterfaceController.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 15.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tableView: WKInterfaceTable!
    
    let tableData = ["1", "2", "3", "4", "5", "6"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        loadTableData()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    private func loadTableData(){
        tableView.setNumberOfRows(tableData.count, withRowType: "RowController")
        for (index, rowModel) in tableData.enumerated() {
            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.rowLabel.setText(rowModel)
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        //Suche nach InterfaceController namens "DetailinterfaceController" und gebe ihm was in tableData unter dem gedrücken Index befindet
        pushController(withName: "DetailInterfaceController", context: tableData[rowIndex])
    }
}
