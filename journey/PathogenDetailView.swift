//
//  PathogenDetailView.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct PathogenDetailView: View {

        var virus: Pathogen
        
        var body: some View {
            ScrollView{
                
                VStack {
                    
                    Spacer(minLength: 200)
                    
                    CircleImage(image: virus.image)
                        .offset(x: 0, y: -130)
                        .padding(.bottom, -130)
                    
                    HStack(alignment: .center) {
                        Text(virus.name)
                            .font(.title)

                        Spacer()
                        Text("Lethality factor \(virus.lethality, specifier: "%.2f")%")
                            .font(.headline)
                    }.padding(.bottom)
                    
                    Text(virus.description)
            
                }.padding()
            }
        }
    }

struct PathogenDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PathogenDetailView(virus: userData.pathogens[1]).environmentObject(userData)
    }
}
