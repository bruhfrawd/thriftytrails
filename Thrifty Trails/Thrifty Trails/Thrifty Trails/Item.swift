//
//  Item.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
