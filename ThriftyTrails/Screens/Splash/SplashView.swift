//
//  SplashView.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 05/05/24.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Properties
    
    @Environment(SharedData.self) var sharedData
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 32) {
            Image(.logoWhite)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 340)
            Spacer().frame(height: 20)
            Button(action: {
                sharedData.screen = .login
            }, label: {
                Text("Get Started")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 16))
                    .padding(.horizontal)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.default)
    }
}

#Preview {
    SplashView()
        .environment(SharedData())
}
