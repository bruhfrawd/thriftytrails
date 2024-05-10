//
//  HotelView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct HotelView: View {
    var body: some View {
        ZStack{
            Color("Background")
            ScrollView{
                VStack{
                    Spacer()
                    HStack(spacing: 5){
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
                        
                        Button(action: {}){
                            Image("btn_selected_hotels")
                                .resizable()
                                .frame(width: 125, height: 50)
                        }
                    }
                    Spacer()
                    Text("STILL IN DEVELOPMENT -Fahad")
                
                }
            }

        }
        .toolbar {
            ToolbarItem(placement: .principal){
                Text("Hotels")
                    .font(.title)
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                Image(systemName: "bed.double.fill" )
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HotelView()
}
