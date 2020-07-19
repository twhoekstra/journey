//
//  ContentView.swift
//  journey
//
//  Created by Thijn Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            WelcomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle")
                        Text("Begin")
                    }
                }
                .tag(0)
            CurveGame()
                .tabItem {
                    VStack {
                        Image(systemName: "gamecontroller")
                        Text("Play")
                    }
                }
                .tag(1)
            Text("Third View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "lightbulb")
                        Text("Learn")
                    }
                }
                .tag(2)
            Text("Fourth View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.3")
                        Text("Lead")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ContentView().environmentObject(userData)
    }
}
