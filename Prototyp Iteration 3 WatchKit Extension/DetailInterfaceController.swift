//
//  DetailInterfaceController.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 15.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import Foundation
import WatchKit

class DetailInterfaceController: WKInterfaceController {
    
    // Alt - Label Test
    // @IBOutlet weak var detailLabel: WKInterfaceLabel!
    @IBOutlet weak var tableView: WKInterfaceTable!
    var tableData = [""]

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //Nimm die Daten, die übergeben wurden und schreibe sie auf detailLabel
        /* Alt - Label Test
        if let detailData = context as? String {
            detailLabel.setText(detailData)
        }*/
        
        switch context as? String {
        case "Auswerfer":
            tableData = ["Endlagen"]
        case "Düse":
            tableData = ["Position", "Endlage"]
        case "Form":
            tableData = ["Position", "Heizung", "Kühlung", "Druck", "Luftkreis"]
        case "Peripherie":
            tableData = ["Steckdose", "Alarmlampe"]
        case "Schnecke":
            tableData = ["Position"]
        default:
            tableData = ["Error!"]
        }
        
        if let detailData = context as? String {
            //Text oben links
            setTitle(detailData)
            //Tabelle laden
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
                rowController.rowLabel.setText(rowModel)
                rowController.rowImage.setImage(UIImage(named: tableData[index]))
            }
        }
    }
}
