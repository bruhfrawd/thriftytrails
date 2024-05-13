//
//  Comparable-Clamped.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 11/05/2024.
//

import Foundation

internal extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
