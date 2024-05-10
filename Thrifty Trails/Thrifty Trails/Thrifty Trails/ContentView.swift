//
//  ContentView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView{
                ExploreView()
            }
            .tabItem{
                Image(systemName: "safari") 
                Text("Explore")
            }
            
            TripView()
                .tabItem{
                    Image(systemName: "airplane")
                    Text("Trips")
                }
            
            ChatView()
                .tabItem{
                    Image(systemName: "message")
                    Text("Messages")
                }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            
        }
        .environment(\.colorScheme, .light)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
