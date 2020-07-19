//
//  Strategy.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Strategy: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var owner: String
    var category: Category
    var isFavorite: Bool
    
    var thresMul: treshMul
    var sigmaMul: Double
    var muMul: Double
    var betaMul: betaMul
    var gammaMul: Double

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case outbreak = "Outbreak Management"
        case impact = "Impact Management"
        case science = "Scientific Insight"
    }
}

extension Strategy {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct treshMul: Hashable, Codable {
    var upper: Double
    var lower: Double
}

struct betaMul: Hashable, Codable {
    var noDist: Double
    var dist: Double
}
