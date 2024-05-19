//
//  AboutView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct AboutView: View {
    var tripLocation = "Paris"
    var wifiUser = "User: XXXX"
    var wifiPass = "Password: XXXX"
    
    var placeDescription = "EMPTY" // Placeholder for the description
    var sampleDescription = "Paris is the capital and most populous city of France."
    
    var body: some View {
        ZStack {
            Color("Brand")
            
            ZStack {
                Color("Background")
                ScrollView {
                    VStack {
                        Spacer()
                        HStack(spacing: 5) {
                            NavigationLink(destination: ItineraryView()) {
                                Image("btn_itinerary")
                                    .resizable()
                                    .frame(width: 125, height: 50)
                            }
                            Button(action: {}) {
                                Image("btn_selected_about")
                                    .resizable()
                                    .frame(width: 125, height: 50)
                            }
                            NavigationLink(destination: HotelView()) {
                                Image("btn_hotels")
                                    .resizable()
                                    .frame(width: 125, height: 50)
                            }
                        }
                        
                        ZStack {
                            Color(.white)
                            VStack {
                                Text("About \(tripLocation)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                                // ABOUT THE LOCATION
                                Text(sampleDescription)
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            }
                        }
                        .padding()  // Padding inside the ZStack
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 5))
                        .padding()
                        
                        ZStack {
                            Color(.white)
                            VStack {
                                Text("Public Wifi Info")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                                Text("Wifi Username: \(wifiUser)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Wifi Password: \(wifiPass)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding()  // Padding inside the ZStack
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 5))
                        .padding()
                        
                        ZStack {
                            Color(.white)
                            VStack {
                                // EMERGENCY CONTACT INFO
                                Text("Emergency Contact Numbers:")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                Text("Police: ")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                Text("Ambulance: ")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                Text("Fire Rescue: ")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            }
                        }
                        .padding()  // Padding inside the ZStack
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 5))
                        .padding()
                        
                        ZStack {
                            Color(.white)
                            VStack {
                                // TRAVEL COST INFORMATION
                                Text("Cost Information")
                                    .font(.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                                Text("Transportation: ")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                                Text("Markets")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                                Text("Restaurants")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            }
                        }
                        .padding()  // Padding inside the ZStack
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 5))
                        .padding()
                        // END OF ITINERARY
                        
                    }
                }
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
        .toolbar {
            ToolbarItem(placement: .principal){
                Text("About")
                    .font(.title)
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                Image(systemName: "person.crop.circle" )
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AboutView()
}
