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
    }
    
    var screen: Screen = .splash
}
