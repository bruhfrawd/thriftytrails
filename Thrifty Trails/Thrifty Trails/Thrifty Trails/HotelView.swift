//
//  HotelView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct HotelView: View {
    // Dummy data for hotels
    let hotels = [
        ("Hotel Sunshine", "$100/night", "hotel_sunshine"),
        ("Ocean View", "$150/night", "ocean_view"),
        ("Mountain Retreat", "$80/night", "mountain_retreat"),
        ("Urban Hotel", "$200/night", "urban_hotel"),
        ("Country Inn", "$90/night", "country_inn")
    ]
    
    var body: some View {
        ZStack {
            Color("Background") // Custom background color set in your asset catalog
            ScrollView {
                VStack(spacing: 20) {
                    HStack(spacing: 5) {
                        NavigationLink(destination: ItineraryView()) {
                            Image("btn_itinerary")
                                .resizable()
                                .frame(width: 125, height: 50)
                        }
                        
                        NavigationLink(destination: AboutView()) {
                            Image("btn_about")
                                .resizable()
                                .frame(width: 125, height: 50)
                        }
                        
                        Button(action: {}) {
                            Image("btn_selected_hotels")
                                .resizable()
                                .frame(width: 125, height: 50)
                        }
                    }
                    .padding(.top, 20)

                    // "Add Hotel" section as shown in your sketch
                    VStack(alignment: .leading) {
                        Text("Add Hotel")
                            .font(.title)
                            .padding(.bottom, 10)

                        // Horizontal scrollable list of hotels
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(hotels, id: \.0) { hotel in
                                    VStack {
                                        Image(hotel.2) // Dummy image identifier
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 180, height: 120)
                                            .clipped()
                                            .cornerRadius(10)
                                        
                                        Text(hotel.0)
                                            .font(.headline)
                                        Text(hotel.1)
                                            .font(.subheadline)
                                    }
                                    .frame(width: 180, height: 180)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding()

                    Spacer()
                    Text("STILL IN DEVELOPMENT -Fahad")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Hotels")
                    .font(.title)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "bed.double.fill")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

