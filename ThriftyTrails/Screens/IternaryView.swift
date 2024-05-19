//
//  ItineraryView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct ItineraryView: View {
    
    var body: some View {
        ZStack {
            Color("Background")
            ScrollView {
                VStack {
                    Spacer()
                    HStack(spacing: 5) {
                        Button(action: {}) {
                            Image("btn_selected_itinerary")
                                .resizable()
                                .frame(width: 125, height: 50)
                        }
                        NavigationLink(destination: AboutView()) {
                            Image("btn_about")
                                .resizable()
                                .frame(width: 125, height: 50)
                        }
                        NavigationLink(destination: HotelView()) {
                            Image("btn_hotels")
                                .resizable()
                                .frame(width: 125, height: 50)
                        }
                    }
                    Spacer()
                    
                    // ITINERARIES
                    ZStack {
                        Color(.white)
                        Text("Thursday, March 8th")
                    }
                    ZStack {
                        Color(.white)
                        VStack {
                            // ITINERARY 1
                            HStack(spacing: 65) {
                                // Time
                                VStack {
                                    Text("11:30 AM")
                                    Text(".")
                                    Text(".")
                                    Text(".")
                                    Text(".")
                                    Text("12:30 AM")
                                }
                                .padding(.vertical)
                                
                                // Description
                                VStack {
                                    Text("Description")
                                    Text("Restaurant")
                                }
                                
                                // Trailing Image
                                VStack {
                                    Rectangle() // Placeholder for city images
                                        .fill(Color.secondary)
                                        .frame(width: 50, height: 75, alignment: .trailing)
                                    Text("25$")
                                }
                            }
                        }
                    }
                    .padding()
                    
                    ZStack {
                        Color(.white)
                        VStack {
                            HStack(spacing: 65) {
                                // Time
                                VStack {
                                    Text("1:00 PM")
                                    Text(".")
                                    Text(".")
                                    Text(".")
                                    Text(".")
                                    Text("2:30 PM")
                                }
                                .padding(.vertical)
                                .padding(.leading)
                                
                                // Description
                                VStack {
                                    Text("Description")
                                    Text("Palace")
                                }
                                
                                // Trailing Image
                                VStack {
                                    Rectangle() // Placeholder for city images
                                        .fill(Color.secondary)
                                        .frame(width: 50, height: 75)
                                        .padding()
                                    Text("30$")
                                }
                            }
                        }
                    }
                    .padding()
                    
                    ZStack {
                        Color(.white)
                        VStack {
                            HStack(spacing: 65) {
                                // Time
                                VStack {
                                    Text("4:00 PM")
                                    Text(".")
                                    Text(".")
                                    Text(".")
                                    Text(".")
                                    Text("5:30 PM")
                                }
                                .padding(.vertical)
                                .padding(.leading)
                                
                                // Description
                                VStack {
                                    Text("Description")
                                    Text("Museum")
                                }
                                
                                // Trailing Image
                                VStack {
                                    Rectangle() // Placeholder for city images
                                        .fill(Color.secondary)
                                        .frame(width: 50, height: 75)
                                        .padding()
                                    Text("50$")
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Itinerary")
                    .font(.title)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "map")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ItineraryView()
}
