//
//  LoginView.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 05/05/24.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @State var email: String = ""
    @State var password: String = ""
    @State var navigateToPlanAdventure = false
    @State var showErrorAlert = false
    @State var loginStatusMessage = ""

    @EnvironmentObject var sharedData: SharedData
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            header
            emailTextfield
            passwordTextfield
            loginButton
            thisIsNotMeButton
            socialLoginButtons
        }
        .padding(.horizontal)
        .navigationDestination(isPresented: $navigateToPlanAdventure) {
            PlanAdventureView()
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Login Failed"), message: Text("Invalid email or password"), dismissButton: .default(Text("OK")))
        }
    }
}

extension LoginView {
    
    // MARK: - Components
    
    var header: some View {
        HStack {
            Text("Welcome Back\nKevin")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: {}, label: {
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
        }
    }
    
    var emailTextfield: some View {
        VStack {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    var passwordTextfield: some View {
        VStack {
            SecureField("Password", text: $password)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    var loginButton: some View {
        Button(action: {
            if DatabaseManager.shared.verifyUser(email: email, password: password) {
                loginStatusMessage = "Login Successful!"
                navigateToPlanAdventure = true
            } else {
                showErrorAlert = true
            }
        }, label: {
            Text("Login")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        })
    }
    
    var thisIsNotMeButton: some View {
        NavigationLink {
            SignupView()
        } label: {
            Text("Oh no, this isn't me")
        }
    }
    
    var socialLoginButtons: some View {
        HStack {
            Button {
                
            } label: {
                Image("facebook")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .padding(8)
            }
            Text("or")
            Button {
                
            } label: {
                Image("google")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .padding(8)
            }
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    LoginView()
        .environmentObject(SharedData())
}
