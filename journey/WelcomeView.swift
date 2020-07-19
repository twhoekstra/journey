//
//  WelcomeView.swift
//  journey
//
//  Created by Thijn Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI


import SwiftUI
  

struct WelcomeView: View {

    @State private var locationIndex = 0
    @State private var virusIndex = 0
    @State private var step: Int = 0
    
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Disease")) {
                    
                    Picker(selection: $virusIndex, label: Text("What pathogen are you worried about?")) {
                        ForEach(0 ..< userData.pathogens.count) {
                            Text(self.userData.pathogens[$0].name)
                        }
                    }
                    IfTrueView(condition: virusIndex != 0){
                       NavigationLink(destination: PathogenDetailView(
                        virus: self.userData.pathogens[self.virusIndex]
                           )) {
                           
                            Text("Things you should know about \(self.userData.pathogens[self.virusIndex].name)")
                           }
                       }
                }
                IfTrueView(condition: virusIndex != 0){
                    Section(header: Text("Location")) {
                   
                        Picker(selection: self.$locationIndex, label: Text("Where do you live?")) {
                            ForEach(0 ..< self.userData.countries.count) {
                                Text(self.userData.countries[$0].name)
                            }
                        }
                    
                    IfTrueView(condition: self.locationIndex != 0){
                        NavigationLink(destination: LocationDetailView(
                         location: self.userData.countries[self.locationIndex]
                            )) {
                            
                                Text("Things you should know about health in \(self.userData.countries[self.locationIndex].name)")
                            }
                        }
                    }
                }
                IfTrueView(condition: locationIndex != 0){
                    Section(header: Text("Leadership")) {
                        HStack {
                            Text("Institution")
                            Spacer()
                            Text("\(self.userData.countries[self.locationIndex].authority)")
                        }
                        HStack {
                            Text("Figurehead")
                            Spacer()
                            Text("\(self.userData.countries[self.locationIndex].leadership)")
                        }
                    }
                }
                
                
            }.navigationBarTitle("Welcome")
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return WelcomeView().environmentObject(userData)
            
    }
}

struct IfTrueView<Content: View>: View {
    var condition: Bool
    var content: () -> Content

    init(condition: Bool, @ViewBuilder _ show: @escaping () -> Content) {
        self.condition = condition
        self.content = show
    }

    @ViewBuilder
    var body: some View {
        if condition {
            content()
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            
            
            //.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            //.cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
