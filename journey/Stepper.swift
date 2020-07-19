//
//  Stepper.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//


import Foundation

func Stepper(input: [Bar], model: Model ) -> [Bar] {
    var Unity = input
    var Adduct: Bar
    var Time: Double = 0
    
    var S: Double
    var E: Double
    var I: Double
    var R: Double
    
    var beta: Double
    
    let startThreshold : Double = model.distThreshold[0]
    let stopThreshold : Double = model.distThreshold[1]
    
    var isDistancing : Bool = false
    
    let mu : Double = model.mu
    let gamma : Double = model.gamma
    let regularBeta : Double = model.beta[0]
    let distancedBeta : Double = model.beta[1]
    let sigma : Double = model.sigma
    
    let deltaT: Double = model.deltaT
    let steps: Int = model.steps
    
    var dSdt: Double
    var dEdt: Double
    var dIdt: Double
    var dRdt: Double
    var N: Double
    
    for _ in 0...steps{
        
        S = Unity.last!.Svalue
        E = Unity.last!.Evalue
        I = Unity.last!.Ivalue
        R = Unity.last!.Rvalue
        //print(S, E, I, R)
        
        N = S + E + I + R
        
        if !isDistancing && (I / N) > startThreshold {
            isDistancing = true
        }
        
        if isDistancing && (I / N) < stopThreshold {
            isDistancing = false
        }
        
        
        if !isDistancing {
            beta = regularBeta
        }
        else {
            beta = distancedBeta
        }
        
        dSdt = mu * (N - S) - beta * (S * I)/N
        dEdt = beta * (S * I)/N - (mu + sigma) * E
        dIdt = sigma * E - (gamma + mu) * I
        dRdt = gamma * I - mu * R
        //print(dSdt, dEdt, dIdt, dRdt)
        
        S = S + dSdt * deltaT
        E = E + dEdt * deltaT
        I = I + dIdt * deltaT
        R = R + dRdt * deltaT
        //print(S, E, I, R)
        
        Time = Time + deltaT
        
        if Time >= 86400 {
            
            Adduct = Bar(
                id: UUID(),
                date: Date.init(timeInterval: Time, since: Unity.last!.date),
                label: "", legend: (isDistancing ? US_Distanced_Legend : US_Simulated_Legend),
                Svalue: S,
                Evalue: E,
                Ivalue: I,
                Rvalue: R)
            
            Unity.append(Adduct)
            
            Time = 0
        }
        
        
        
    }
    
    return Unity
}


