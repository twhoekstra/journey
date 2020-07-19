//
//  Pathogen.swift
//  journey
//
//  Created by Thijn Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Pathogen: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var aka: String
    var lethality: Double
    var description: String
    fileprivate var imageName: String
}

extension Pathogen {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
