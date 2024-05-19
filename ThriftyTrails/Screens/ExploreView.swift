//
//  ExploreView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct ExploreView: View {
    var arrayOfCities = ["Paris", "Rome", "Italy"] // Place holder for Cities
    var numDays = "15" // Place holder for # of dates
    var dateSample = "08 March 2024" // Place holder for date

    var body: some View {
        let joinedCities = arrayOfCities.joined(separator: ", ")
        ZStack {
            Color("Brand")
            ZStack {
                Color("Background")
                VStack {
                    HStack(spacing: 70) {
                        VStack {
                            Text("Date of Trip:")
                                .font(.title)
                            Text("\(dateSample)")
                                .font(.system(size: 20))
                        }
                        VStack {
                            Text("Length: ")
                                .font(.title)
                            Text("\(numDays) days")
                                .font(.system(size: 20))
                        }
                    }
                    .padding(.top, 10)
                    Text(joinedCities)
                        .padding()
                        .frame(alignment: .leading)

                    // Sliding window for cities
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(arrayOfCities, id: \.self) { city in
                                VStack {
                                    Image(city)  // Assuming you have images named after each city in your assets
                                        .resizable() // Makes the image resizable
                                        .scaledToFill() // Maintains the image's aspect ratio while filling the frame
                                        .border(Color.black)
                                        .frame(width: 200, height: 450) // Specifies the frame size
                                        .clipped() // Clips the overflowing parts of the image to fit the frame
                                    Text(city)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 3)

                    // Sliding END
                    // ITINERARY, ABOUT, and HOTEL BUTTONS
                    Spacer()
                    ZStack {
                        Color(.white)
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
                            NavigationLink(destination: HotelView()) {
                                Image("btn_hotels")
                                    .resizable()
                                    .frame(width: 125, height: 50)
                            }
                        }
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 0)
                }
            }
            .padding(.horizontal, 3)
            .padding(.vertical, 3)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "house")
                    .foregroundColor(Color("Brand"))
            }
            ToolbarItem(placement: .principal) {
                Text("Home")
                    .foregroundColor(Color("Brand"))
                    .font(.title)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(Color("Brand"))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExploreView()
}
