//
//  Definitions.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI
import Foundation

struct Legend: Hashable {
    let color: Color
    let label: String
}

struct Bar: Identifiable{
    let id: UUID
    let date: Date
    let label: String
    let legend: Legend
    
    let Svalue: Double
    let Evalue: Double
    let Ivalue: Double
    let Rvalue: Double
}

struct Model {
    var distThreshold: [Double] //Percentage upper limit (When social distancing starts), then lower limit (When social distancing stops)
    var sigma: Double
    var mu: Double
    var beta: [Double] // Array with non-distancing value followed by distancing value
    var gamma: Double
    var deltaT: Double  //Number of seconds that corresponds to a step
    var steps: Int //Number of steps to take
}

let US_Legend = Legend(color: .red, label: "USA Infected")

let US_Simulated_Legend = Legend(color: .gray, label: "Simulation")

let US_Distanced_Legend = Legend(color: .blue, label: "With Social Distancing")
 
let US_Start = Date(timeIntervalSinceReferenceDate: 611524081)

let US_Data: [Bar] = [
    
    Bar(
        id: UUID(),
        date: US_Start,
        label: "",
        legend: US_Legend,
        Svalue: 100,
        Evalue: 0,
        Ivalue: 1,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 99,
        Evalue: 0,
        Ivalue: 2,
        Rvalue: 0
    )
]

let US_Model = Model(
    distThreshold: [0.20, 0.10],
    sigma: 0.5 / 86400,
    mu: 0.001 / 86400,
    beta: [0.9 / 86400, 0.015 / 86400],
    gamma: 0.1 / 86400,
    deltaT: 86400 * 0.25, // Time step in days
    steps: 365 * 4)

let US_Data_Long: [Bar] = [
    
    Bar(
        id: UUID(),
        date: US_Start,
        label: "",
        legend: US_Legend,
        Svalue: 100,
        Evalue: 0,
        Ivalue: 1,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 1, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 80,
        Evalue: 0,
        Ivalue: 21,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 2, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 40,
        Evalue: 0,
        Ivalue: 41,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 3, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 10,
        Evalue: 0,
        Ivalue: 91,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 4, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 9,
        Evalue: 0,
        Ivalue: 92,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 5, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 8,
        Evalue: 0,
        Ivalue: 93,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 6, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 8,
        Evalue: 0,
        Ivalue: 93,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 7, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 7,
        Evalue: 0,
        Ivalue: 94,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 8, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 7,
        Evalue: 0,
        Ivalue: 94,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 9, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 7,
        Evalue: 0,
        Ivalue: 94,
        Rvalue: 0
    ),

    Bar(
        id: UUID(),
        date: Date.init(timeInterval: 86400 * 10, since: US_Start),
        label: "",
        legend: US_Legend,
        Svalue: 7,
        Evalue: 0,
        Ivalue: 94,
        Rvalue: 0
    ),
]
