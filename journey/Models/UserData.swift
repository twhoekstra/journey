//
//  UserData.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = true
    @Published var strategies = strategyData
    @Published var countries = countryData
    @Published var pathogens = pathogenData
    @Published var model: Model = US_Model
    @Published var top: Int = 0
}
