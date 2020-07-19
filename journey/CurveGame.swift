//
//  CurveGame.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

struct CurveGame: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                //Text(String(self.userData.model.beta[1]))
                
                Dashboard().animation(.spring())
                
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Linked Only")
                }
                
                ForEach(Array(zip(0..., userData.strategies)), id: \.1.id) { number, strat in
                    Group{
                        if !self.userData.showFavoritesOnly || strat.isFavorite {
                            NavigationLink(
                                destination: StrategyDetail(strategy: strat)
                                    .environmentObject(self.userData)
                            ) {
                                StrategyRow(strategy: strat, index: number)
                                    .zIndex(1)
                            }
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("Play"))
        }
    }
}

struct CurveGame_Previews: PreviewProvider {
    static var previews: some View {
       // ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            CurveGame()
           //     .previewDevice(PreviewDevice(rawValue: deviceName))
          //      .previewDisplayName(deviceName)
       // }
       .environmentObject(UserData())
    }
}
