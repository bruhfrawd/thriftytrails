//
//  ProfileView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            List {
                // User profile header
                VStack(alignment: .leading) {
                    Text("Kevin")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("kevin2020@gmail.com")
                        .font(.subheadline)
                }
                .padding()
                
                // Preferences Section
                Section(header: Text("Preferences")) {
                    NavigationLink(destination: Text("Notifications Settings")) {
                        HStack {
                            Image(systemName: "bell.fill")
                            Text("Notification")
                        }
                    }
                    
                    NavigationLink(destination: Text("Language Settings")) {
                        HStack {
                            Image(systemName: "character.book.closed.fill")
                            Text("Language")
                        }
                    }
                    
                    NavigationLink(destination: Text("Currency Settings")) {
                        HStack {
                            Image(systemName: "dollarsign.circle.fill")
                            Text("Currency")
                        }
                    }
                }
                
                // Legal Section
                Section(header: Text("Legal")) {
                    NavigationLink(destination: Text("Privacy Policy Details")) {
                        Text("Privacy Policy")
                    }
                    
                    NavigationLink(destination: Text("Terms of Use Details")) {
                        Text("Terms of Use")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Profile", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {}) {
                Text("Sign Out")
            })
        }
    }
}


