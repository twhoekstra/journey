//
//  LegendView.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

struct LegendView: View {
    private var legends: [Legend]

    init(bars: [Bar]) {
        legends = Array(Set(bars.map { $0.legend }))
        legends.sort{
            $0.label < $1.label
        }
    }

    var body: some View {
        HStack(alignment: .center) {
            ForEach(legends, id: \.self) { legend in
                VStack(alignment: .center) {
                    Circle()
                        .fill(legend.color)
                        .frame(width: 16, height: 16)
            //.shadow(color: .black, radius: 4, x: 2, y: 2)

                    Text(legend.label)
                        .font(.subheadline)
                        .lineLimit(nil)
                }
            }
        }
    }
}

struct LegendView_Previews: PreviewProvider {
    static var previews: some View {
        LegendView(bars: US_Data)
    }
}

