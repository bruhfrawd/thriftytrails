//
//  ContentView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        TabView {
            NavigationStack {
                ExploreView()
            }
            .tabItem {
                Image(systemName: "safari")
                Text("Explore")
            }
            
            NavigationStack {
                TripView()
            }
            .tabItem {
                Image(systemName: "airplane")
                Text("Trips")
            }
            
            NavigationStack {
                ChatView()
            }
            .tabItem {
                Image(systemName: "message")
                Text("Messages")
            }
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
        .environmentObject(sharedData)
        .environment(\.colorScheme, .light)
        .navigationBarBackButtonHidden(true)
    }
    
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
