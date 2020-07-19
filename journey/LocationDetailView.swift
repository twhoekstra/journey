//
//  LocationDetailView.swift
//  journey
//
//  Created by Thijn Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

struct LocationDetailView: View {
@EnvironmentObject private var userData: UserData
        var location: Country
        
        var body: some View {
            ScrollView{
                
                VStack {
                    MapView(coordinate: location.locationCoordinate)
                    
                    .frame(height: 300)
                    
                    CircleImage(image: location.image)
                        .offset(x: 0, y: -130)
                        .padding(.bottom, -130)
                    
                    HStack(alignment: .center) {
                        Text(location.name)
                            .font(.title)

                        Spacer()
                        Text("Population Density \(location.density, specifier: "%.2f") /km") + Text("2")
                                     .font(.system(size: 10))
                                     .baselineOffset(6.0)
                            .font(.headline)
                    }.padding()
                    
                    Text(location.description).padding()
            
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LocationDetailView(location: userData.countries[2]).environmentObject(userData)
    }
}

