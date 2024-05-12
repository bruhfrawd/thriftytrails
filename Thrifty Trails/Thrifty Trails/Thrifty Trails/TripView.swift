//
//  TripView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct TripView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 10) {
                    Text("08 March 15 Mar")
                        .font(.headline)
                    Text("Rome, Paris and Italy")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("10 days")
                        .font(.subheadline)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Cost")
                                .font(.caption)
                            Text("$100")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Budget")
                                .font(.caption)
                            Text("$21")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Budget Breakdown")
                            .font(.headline)
                        Text("$1500 in total")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                // Placeholder for more detailed budget breakdown or other information
                Rectangle()
                    .frame(height: 150)
                    .foregroundColor(Color.gray.opacity(0.3))
            }
            .navigationBarTitle("My Trips", displayMode: .inline)
        }
    }
}



struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
