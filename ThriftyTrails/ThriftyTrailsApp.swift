//
//  ThriftyTrailsApp.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 11/05/2024.
//

import SwiftUI

@main
struct ThriftyTrailsApp: App {
    
    @State var sharedData = SharedData()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                switch sharedData.screen {
                case .splash:
                    SplashView()
                case .login:
                    LoginView()
                }
            }
        }
        .environment(sharedData)
    }
}
