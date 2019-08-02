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
    var tableData: [String] = []
    var prevTableData: String = ""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //Nimm die Daten, die übergeben wurden und schreibe sie auf detailLabel
        /* Alt - Label Test
        if let detailData = context as? String {
            detailLabel.setText(detailData)
        }*/
        if let detailData = context as? String {
        switch detailData {
        case "Auswerfer":
            tableData = ["Endlagen"]
        case "Düse":
            tableData = ["Position", "Endlage"]
        case "Form":
            tableData = ["Heizung", "Holmposition", "Kühlung", "Luftkreis"]
        case "Peripherie":
            tableData = ["Alarmlampe", "Steckdose"]
        case "Schnecke":
            tableData = ["Position"]
        default:
            tableData = ["Error!"]
        }
            prevTableData = detailData
            //Text oben links
            setTitle(detailData)
            //Tabelle laden
            loadTableData(tableData: tableData)
        }
    }
    override func willActivate() {
        super.willActivate()
    }
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    private func loadTableData(tableData: [String]){
        tableView.setNumberOfRows(tableData.count, withRowType: "RowController")
        for (index, rowModel) in tableData.enumerated() {
            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.rowLabel.setText(rowModel)
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        //Suche nach InterfaceController namens "DetailinterfaceController" und gebe ihm was in tableData unter dem gedrücken Index befindet
        pushController(withName: "IOInterfaceController", context: ioCard(langtext: prevTableData + "-" + tableData[rowIndex], status: false, bmk: "", force: false, index: 0, type: "DO"))
    }
}
