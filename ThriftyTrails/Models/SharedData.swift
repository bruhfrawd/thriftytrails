//
//  SharedData.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 11/05/2024.
//

import Foundation

@Observable
class SharedData {
    
    enum Screen {
        case splash
        case login
        case explore
        case itinerary
        case about
        case hotel
    }
    
    var screen: Screen = .splash
}
