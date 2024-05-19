//
//  AboutView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI
import Foundation
import Combine

struct AboutView: View {
    

    var tripLocation = "Paris"
    var wifiUser = "User: XXXX"
    var wifiPass = "Password: XXXX"
    
    
    var PlaceDescription = "EMPTY" //place holder for the description
    var sampleDescription = "Paris is the capital and most populous city of France. "
    
    var body: some View {
        ZStack{
            Color("Brand")
            ZStack{
                ScrollView{
                    VStack{
                        
                        ZStack{
                            Color("Brand")
                            HStack(spacing: 5){
                                NavigationLink(destination: ItineraryView()){
                                    Image("btn_itinerary")
                                        .resizable()
                                        .frame(width: 125, height: 50)
                                }
                                Button(action: {}){
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
                            .padding(.vertical, 5)
                        }
                        .padding(.top, 0)
                        
                        
                        ZStack{
                            Color(.white)
                            VStack{
                                Text("About \(tripLocation)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Brand"))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                                // ABOUT THE LOCATION
                                Text(sampleDescription)
                                    .padding()
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
                                Text("Public Wifi Info")
                                    .brandStyleSmallTitle()
                                    .padding()
                                
                                Text("Wifi Username: \(wifiUser)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                                Text("Wifi Password: \(wifiPass)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
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
                                // EMERGENCY CONTACT INFO
                                Text("Emergency Contact Numbers:")
                                    .brandStyleSmallTitle()
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
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 3))
                        .padding()
                        
                        
                        ZStack{
                            Color(.white)
                            VStack{
                                //TARVEL COST INFROMATION
                                Text("Cost Information")
                                    .brandStyleSmallTitle()
                                    .padding()
                                
                                Text("Transportation: ")
                                    .brandStyleText()
                                    .padding()
                                
                                Text("Markets")
                                    .brandStyleText()
                                    .padding()
                                
                                Text("Restaurants")
                                    .brandStyleText()
                                    .padding()
                                
                            }
                        }
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brand"), lineWidth: 3))
                        .padding()
                        //END OF ITINERARY
                        
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
                Text("About")
                    .brandStyleTitle()
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                Image(systemName: "info.circle" )
                    .foregroundColor(Color("Brand"))
                    .fontWeight(.bold)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    AboutView()
}
