//
//  LoginView.swift
//  ThriftyTrails
//
//  Created by Gaganjot Singh on 05/05/24.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @State var email: String = ""
    @State var password: String = ""
    @State var goToPlanAdventure = false
    
    @Environment(SharedData.self) var sharedData
        
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            header
            thisIsNotMeButton
            passwordTextfield
            loginButton
            socialLoginButtons
        }
        .padding(.horizontal)
        .navigationDestination(isPresented: $goToPlanAdventure) {
            PlanAdventureView()
        }
    }
}

extension LoginView {
    
    // MARK: - Components
    /// title
    var header: some View {
        HStack {
            Text("Welcome Back\nKenvin")
                .font(.title)
                .fontWeight(.bold)
            
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Circle()
                    .fill()
                    .frame(width: 80)
                    .overlay {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                            .fontWeight(.bold)
                    }
            })
        } //: HStack
    }
    
    /// email text field
    var emailTextfield: some View {
        VStack {
            TextField("Email", text: $email)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    /// password text field
    var passwordTextfield: some View {
        VStack {
            TextField("Password", text: $password)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    /// login button to go to next screen
    var loginButton: some View {
        Button(action: {
            goToPlanAdventure = true
        }, label: {
            Text("Login")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.default)
                .clipShape(.rect(cornerRadius: 16))
        })
    }
    
    /// button for signup
    var thisIsNotMeButton: some View {
        NavigationLink {
            SignupView()
        } label: {
            Text("Oh no, this isn't me")
        }
    }
    
    /// social login buttons container view
    var socialLoginButtons: some View {
        HStack {
            Button {
                
            } label: {
                Image(.facebook)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .padding(8)
            }
            Text("or")
            Button {
                
            } label: {
                Image(.google)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .padding(8)
            }
        } //: HStack
        .frame(maxWidth: .infinity)
    }
}
#Preview {
    LoginView()
        .environment(SharedData())
}
