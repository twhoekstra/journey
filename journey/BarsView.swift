//
//  BarsView.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index) * 0.60)
        
    }
}

extension AnyTransition {
    static var asymmetricSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

let DateFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.locale = Locale(identifier: "en_US")
    //formatter.dateFormat = "d MM"
    
    return formatter
}()

let TinyFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.locale = Locale(identifier: "en_US")
    formatter.dateFormat = "d MM"
    
    return formatter
}()

struct BarsView: View {
    
    
    
    let bars: [Bar]
    let max: Double
    let days: CGFloat
    
    
    init(bars: [Bar], days: CGFloat){
        self.bars = bars
        self.max = bars.map {$0.Svalue}.max() ?? 0
        self.days = days
    }
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            
            VStack {
                
                Spacer()
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(Array(zip(1..., self.bars)), id: \.1.id) { number, bar in
                        Capsule()
                            .fill(bar.legend.color)
                            .frame(height: CGFloat(bar.Ivalue) / CGFloat(self.max) * geometry.size.height)
                            .accessibility(label: Text(bar.label))
                            .accessibility(value: Text(bar.legend.label))
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            /* .overlay(
                             
                             Text("\(bar.date, formatter: TinyFormat)")
                             //.rotationEffect(angle: 90)
                             .offset(y: -10),
                             
                             alignment: .bottom
                             )
                             */
                            .transition(.asymmetricSlide)
                            .animation(.ripple(index: number))
                        
                    }
                }
            }
        }.frame(width: UIScreen.main.bounds.size.width * CGFloat(bars.count) / self.days)
           // .padding(.bottom, 35)
    }
    
}

struct BarsView_Previews: PreviewProvider {
    static var previews: some View {
        BarsView(bars: US_Data_Long, days: 21)
    }
}

