//
//  Country.swift
//  journey
//
//  Created by Thijn Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Country: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var description: String
    var density: Double
    var authority: String
    var leadership: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

extension Country {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}


