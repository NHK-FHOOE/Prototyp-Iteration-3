//
//  IOInterfaceController.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 16.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import Foundation
import WatchKit

var tableData: [ioCard] = [ioCard(langtext: "", status: false, bmk: "", force: false, index: 0, type: "DO")]

class IOInterfaceController: WKInterfaceController {
    
    // Alt - Label Test
    @IBOutlet weak var tableView: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // IO Details nur bei Karten anzeigen, die für Test relevant sind
        if let detailData = context as? ioCard {
            switch detailData.langtext {
            case "Form-Luftkreis":
                tableData = formLuftData
            case "Form-Holmposition":
                tableData = formHolmData
            default:
                tableData = [context] as! [ioCard]
            }
        }
            
        loadTableData(tableData: tableData)
    }
    override func willActivate() {
        super.willActivate()
        loadTableData(tableData: tableData)        
    }
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func loadTableData(tableData: [ioCard]){
        tableView.setNumberOfRows(tableData.count, withRowType: "IORowController")
        for (index, rowModel) in tableData.enumerated() {
            if let rowController = tableView.rowController(at: index) as? IORowController {
                rowController.LangtextLabel.setText(rowModel.langtext)
                
                if rowModel.type == "DI" || rowModel.type == "DO"{
                    if rowModel.status {
                        rowController.statusLabel.setText("Aktiv")
                    } else {
                        rowController.statusLabel.setText("Inaktiv")
                    }
                } else {
                    rowController.statusLabel.setText("401 mm")
                }
                
                if rowModel.force {
                    rowController.statusLabel.setTextColor(UIColor.red)
                } else {
                    rowController.statusLabel.setTextColor(UIColor.white)
                }
                rowController.BMKLabel.setText(rowModel.bmk)
                rowController.BMKLabel.setTextColor(UIColor.gray)
            }
        }
    }
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        //Suche nach InterfaceController namens "DetailinterfaceController" und gebe ihm was in tableData unter dem gedrücken Index befindet
        if tableData[0].type == "DO"{
            pushController(withName: "Dialog", context: tableData[rowIndex])
        } else {
            pushController(withName: "DialogAnalog", context: tableData[rowIndex])
        }
    }
    
    
    

    
    
    
    
    
    
    
    
    
}
