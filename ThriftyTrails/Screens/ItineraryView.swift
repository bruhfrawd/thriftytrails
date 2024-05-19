//
//  ItineraryView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct ItineraryView: View {
    
    var body: some View {
        ZStack{
            Color("Brand")
            ZStack{
                ScrollView{
                    VStack{
                        ZStack{
                            Color("Brand")
                            HStack(spacing: 5){
                                Button(action: {}){
                                    Image("btn_selected_itinerary")
                                        .resizable()
                                        .frame(width: 125, height: 50)
                                }
                                NavigationLink(destination: AboutView()){
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
                            .padding(.vertical, 5)
                        }
                        
                        Spacer()
                        
                        //ITINERARIES
                        ZStack{
                            Text("Thursday, March 8th")
                                .brandStyleTitle()                        }
                        .padding(.top)
                        .padding(.bottom, 0)
                        ZStack{
                            Color(.white)
                            VStack{
                                //ITINERARY 1
                                HStack(spacing: 65){
                                    //Time
                                    VStack{
                                        Text("11:30 AM")
                                        Text(".")
                                        Text(".")
                                        Text(".")
                                        Text(".")
                                        Text("12:30 AM")
                                    }
                                    .padding(.vertical)
                                    
                                    //Description
                                    VStack{
                                        Text("Description")
                                        Text("Restaurant")
                                    }
                                    
                                    //Trailing Image
                                    VStack{
                                        Rectangle() // Placeholder for city images
                                            .fill(Color.secondary)
                                            .frame(width: 50, height: 75, alignment: .trailing)
                                        Text("25$")
                                    }
                                }
                            }
                        }
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 3))
                        .padding(.top, 0)
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        ZStack{
                            Color(.white)
                            VStack{
                                HStack(spacing: 65){
                                    //Time
                                    VStack{
                                        Text("1:00 PM")
                                        Text(".")
                                        Text(".")
                                        Text(".")
                                        Text(".")
                                        Text("2:30 PM")
                                    }
                                    .padding(.vertical)
                                    .padding(.leading)
                                    
                                    //Description
                                    VStack{
                                        Text("Description")
                                        Text("Palace")
                                    }
                                    
                                    //Trailing Image
                                    VStack{
                                        Rectangle() // Placeholder for city images
                                            .fill(Color.secondary)
                                            .frame(width: 50, height: 75)
                                            .padding()
                                        Text("30$")
                                    }
                                }
                            }
                        }
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 3))
                        .padding()
                        
                        
                        ZStack{
                            Color(.white)
                            VStack{
                                HStack(spacing: 65) {
                                    //Time
                                    VStack{
                                        Text("4:00 PM")
                                        Text(".")
                                        Text(".")
                                        Text(".")
                                        Text(".")
                                        Text("5:30 PM")
                                    }
                                    .padding(.vertical)
                                    .padding(.leading)
                                    
                                    //Description
                                    VStack{
                                        Text("Description")
                                        Text("Musuem")
                                    }
                                    
                                    //Trailing Image
                                    VStack{
                                        Rectangle() // Placeholder for city images
                                            .fill(Color.secondary)
                                            .frame(width: 50, height: 75)
                                            .padding()
                                        Text("50$")
                                    }
                                }
                            }
                        }
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 3))
                        .padding()
                    }
                }
                
            }
            .brandBackground()
            .padding(.horizontal, 3)
            .padding(.vertical, 3)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                NavigationLink(destination: ExploreView()){
                    HStack{
                        Image(systemName: "house")
                            .foregroundColor(Color("Brand"))
                        Text("Return")
                    }
                }
            }
            
            ToolbarItem(placement: .principal){
                Text("Itinerary")
                    .brandStyleTitle()
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                Image(systemName: "map" )
                    .foregroundColor(Color("Brand"))
                    .fontWeight(.bold)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ItineraryView()
}
