//
//  Dashboard.swift
//  journey
//
//  Created by Thijn Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

let horizons: [CGFloat] = [0.25, 0.5, 1, 1]

struct Dashboard: View {
    @State var pickerSelection = 2
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            Picker(selection: $pickerSelection, label: Text("Horizon"))
                {
                Text("Quarter").tag(0)
                Text("1/2 Year").tag(1)
                Text("Year").tag(2)
                Text("Off").tag(3)
                    
            }.pickerStyle(SegmentedPickerStyle())
                .padding(10)
            
            Plotter(bars: (!(pickerSelection == 3) ? (Stepper(input: US_Data, model: userData.model)) : []), days: 365 * horizons[pickerSelection])
                .frame(height: 400)
        }

    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
            
    }
}
