//
//  DateLine.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

struct DateLine: View {
    
    let disp: String
    
    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width * 0.5, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width * 0.5, y: geometry.size.height))
                }.stroke()
            }
        Text(disp)
        
        }
    }
}

struct DateLine_Previews: PreviewProvider {
    static var previews: some View {
        DateLine(disp: "Test")
    }
}

