//
//  globalVariables.swift
//  Prototyp Iteration 3 WatchKit Extension
//
//  Created by Niels-Hendrik Klopsch on 22.07.19.
//  Copyright © 2019 Niels-Hendrik Klopsch. All rights reserved.
//

import Foundation

//Sematischer Aufbau einer IO Card
struct ioCard {
    var langtext: String
    var status: Bool
    var bmk: String
    var force: Bool
    var index: Int
    var type: String
}

//Inhalt Luftventils
var formLuftData = [
    ioCard(langtext: "Ventil Luftkreis 1",status: false, bmk: "=AG001-BA01-B100", force: false, index: 0, type: "DO")]

//Inhalt 4x Holm-Wegaufnehmer
var formHolmData = [
    ioCard(langtext: "Holmposition 1", status: false, bmk: "=GC001-BS01-B100", force: false, index: 0, type: "AI"),
    ioCard(langtext: "Holmposition 2", status: false, bmk: "=GC001-BS01-B101", force: false, index: 1, type: "AI"),
    ioCard(langtext: "Holmposition 3", status: false, bmk: "=GC001-BS01-B102", force: false, index: 2, type: "AI"),
    ioCard(langtext: "Holmposition 4", status: false, bmk: "=GC001-BS01-B103", force: false, index: 3, type: "AI")]

//Inhalt Teilesensor Roboter
var roboterDruckData = [
    ioCard(langtext: "Teilesensor Roboter", status: false, bmk: "=FA001-BA01-B100", force: false, index: 0, type: "DI")]
