//
//  SplashView.swift
//  ThriftyTrails
//
//  Created by Gaganjot Singh on 05/05/24.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Properties
    
    @Environment(SharedData.self) var sharedData
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Thrifty\nTrails")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer().frame(height: 200)
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
