//
//  BrandTextStyle.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 11/5/2024.
//

import Foundation
import SwiftUI



//TITLE STYLE
struct brandStyleTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color("Brand"))
            
    }
}

//SMALL TITLE
struct brandStyleSmallTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 21))
            .fontWeight(.bold)
            .foregroundColor(Color("Brand"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//NORMAL TEXT STYLE
struct brandStyleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct brandBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    colors: [Color("Background2"), Color("Background")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
    }
}

extension View {
    func brandBackground() -> some View {
        self.modifier(brandBackgroundModifier())
    }
}


extension View {
    func brandStyleTitle() -> some View {
        modifier(brandStyleTitleModifier())
    }
}

extension View {
    func brandStyleSmallTitle() -> some View {
        modifier(brandStyleSmallTitleModifier())
    }
}

extension View {
    func brandStyleText() -> some View {
        modifier(brandStyleTextModifier())
    }
}
