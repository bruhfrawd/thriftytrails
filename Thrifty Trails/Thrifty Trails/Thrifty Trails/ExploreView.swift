//
//  HomeView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct ExploreView: View {
    var arrayOfCities = ["Paris", "Rome", "Italy"] //Place holder for Cities
    var numDays = "15" // Place holder for # of dates
    var dateSample = "08 March 2024" //Place holder for date
    
    
    
    var body: some View {
        let joinedCities = arrayOfCities.joined(separator: ", ")
        
        ZStack{
            Color("Brand")
            ZStack{
                VStack{
                    ZStack{
                        Color(.white)
                        HStack(spacing: 70){
                            VStack{
                                Text("Date of Trip:")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Brand"))
                                Text("\(dateSample)")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("Brand"))
                            }
                            VStack{
                                Text("Length: ")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Brand"))
                                Text("\(numDays) days")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("Brand"))
                            }
                        }
                        .padding(.top, 10)
                    }
                    HStack{
                        Image(systemName: "location.square")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("Brand"))
                            .fontWeight(.bold)
                            .padding(.leading, 5)
                        
                        Text(joinedCities)
                            .padding(.vertical)
                            .font(.system(size:23))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    // Sliding window for cities
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(arrayOfCities, id: \.self) { city in
                                VStack {
                                    Image(city)  // Assuming we have images named after each city in your assets
                                        .resizable()
                                        .scaledToFill()
                                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                        .frame(width: 200, height: 450)
                                        .clipped()
                                    Text(city)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 3)
                    
                    
                    // Sliding END
                    //ITINERARY, ABOUT, and HOTEL BUTTONS
                    Spacer()
                    ZStack{
                        Color("Brand")
                        HStack(spacing: 5) {
                            NavigationLink(destination: ItineraryView()){
                                Image("btn_itinerary")
                                    .resizable()
                                    .frame(width: 125, height: 50)
                                
                                
                            }
                            NavigationLink(destination: AboutView()){
                                Image("btn_about")
                                    .resizable()
                                    .frame(width: 125, height: 50)
                                
                            }
                            NavigationLink(destination: HotelView()){
                                Image("btn_hotels")
                                    .resizable()
                                    .frame(width: 125, height: 50)
                                
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 0)
                    
                }
            }
            .brandBackground()
            .padding(.horizontal, 3)
            .padding(.vertical, 3)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Image(systemName: "house")
                    .foregroundColor(Color("Brand"))
                    .fontWeight(.bold)
            }
            ToolbarItem(placement: .principal){
                Text("Home")
                    .foregroundColor(Color("Brand"))
                    .brandStyleTitle()
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Image(systemName: "person.crop.circle" )
                    .foregroundColor(Color("Brand"))
                    .fontWeight(.bold)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    ExploreView()
}
