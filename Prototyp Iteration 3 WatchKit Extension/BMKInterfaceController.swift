//
//  BMKInterfaceController.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 23.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import Foundation
import WatchKit

class BMKInterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        setTitle("BMK")
        super.awake(withContext: context)
        let items1: [WKPickerItem] = pickerList1.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        let items2: [WKPickerItem] = pickerList2.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        let items3: [WKPickerItem] = pickerList3.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        bmkPicker1.setItems(items1)
        bmkPicker2.setItems(items2)
        bmkPicker3.setItems(items3)
    }
    
    @IBOutlet weak var bmkPicker1: WKInterfacePicker!
    @IBOutlet weak var bmkPicker2: WKInterfacePicker!
    @IBOutlet weak var bmkPicker3: WKInterfacePicker!
    

    @IBAction func bmkPickerChanged1(_ value: Int) {
        pickerListPos1 = value
    }
    @IBAction func bmkPickerChanged2(_ value: Int) {
        pickerlistPos2 = value
    }
    @IBAction func bmkPickerChanged3(_ value: Int) {
        pickerListPos3 = value
    }
    
    @IBAction func onAcceptPressed() {
        let selectedPick: String = "="+pickerList1[pickerListPos1]+"-"+pickerList2[pickerlistPos2]+"-"+pickerList3[pickerListPos3]
        
        switch selectedPick {
        case formLuftData[0].bmk:
            pushController(withName: "IOInterfaceController", context: formLuftData[0])
        case formHolmData[0].bmk:
            pushController(withName: "IOInterfaceController", context: formHolmData[0])
        case formHolmData[1].bmk:
            pushController(withName: "IOInterfaceController", context: formHolmData[1])
        case formHolmData[2].bmk:
            pushController(withName: "IOInterfaceController", context: formHolmData[2])
        case formHolmData[3].bmk:
            pushController(withName: "IOInterfaceController", context: formHolmData[3])
        case roboterDruckData[0].bmk:
            pushController(withName: "IOInterfaceController", context: roboterDruckData[0])
        default:
            pushController(withName: "IOInterfaceController", context:ioCard(langtext: "Sonderoption", status: false, bmk: selectedPick, force: false, index: 0, type: "DI"))
        }
    }
    
    var pickerList1: [String] = ["AC001","AG001","BA001","BA002","DB001","FA001","GC001"]
    var pickerList2: [String] = ["BA01","BS01","BS13"]
    var pickerList3: [String] = ["B100","B101","B102","B103","B104"]
    
    var pickerListPos1 = 0
    var pickerlistPos2 = 0
    var pickerListPos3 = 0
}
