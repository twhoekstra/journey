//
//  Plotter.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

struct Plotter: View {
    @State var posX: CGFloat = 0
    @State var size: CGFloat = 1
    /*
     @State var scroll: CGFloat = 10.00 //UIScreen.main.bounds.width
     
     
     
     func setScroll (input: CGFloat) {
     scroll = input
     }
     */
    
    let bars: [Bar]
    
    let days: CGFloat
    
    var body: some View {
        
            Group{
                
                if bars.isEmpty {
                    Text("There is no data to display chart...")
                }
                else {
                }
                
                VStack {
                    
                    
                    ZStack(){
                       
                        //Color(.black).edgesIgnoringSafeArea(.all)
                        Group {
                            
                            
                            ScrollView(.horizontal){
                                ZStack(alignment: .bottom){
                                    GeometryReader { innerGeo -> Text in
                                        self.posX = -innerGeo.frame(in: .global).minX
                                        self.size = innerGeo.size.width
                                        return Text("")
                                    }
                                    
                                    BarsView(bars: self.bars, days: self.days)
                                        .padding(.bottom, 40)
                                    
                                    
                                }
                            }
                            
                            
                        }
                        DateLine(disp: returnDate(position: self.posX, size: self.size, days: days, bars: bars))
                            .offset(y: -10)
                    }
                    LegendView(bars: bars)
                        .padding()
                        .accessibility(hidden: true)
                    /*
                     Text("\(self.posX)")
                     Text("\(self.size)")
                     Text("\(returnDate(position: self.posX, size: self.size, days: days, bars: bars))")
                     
                     */
                }
        }
    }
}


//Text("\(date, formatter: DateFormat)")

func returnDate (position: CGFloat, size: CGFloat, days: CGFloat, bars: [Bar]) -> String {
    let text: String
    let count = CGFloat(bars.count)
    let slope: CGFloat = count / size
    let index: CGFloat = position * slope + days * 0.5
    
    if (index > count) || (index < 0) {
        text = "There is no date to display..."
    }
    else {
        text = DateFormat.string(from: bars[Int(index)].date)
    }
    return text
}



struct Plotter_Previews: PreviewProvider {
    static var previews: some View {
        Plotter(bars: US_Data_Long, days: 14)
    }
}
