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
    @State var navigateToExplore = false
    @State var showSuccessMessage = false
    @State var showErrorAlert = false
    @State var loginStatusMessage = ""

    @Environment(SharedData.self) var sharedData
        
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            header
            emailTextfield
            passwordTextfield
            loginButton
            thisIsNotMeButton
            socialLoginButtons
            if showSuccessMessage {
                Text(loginStatusMessage)
                    .foregroundColor(.green)
                    .padding(.top)
            }
        }
        .padding(.horizontal)
        .navigationDestination(isPresented: $navigateToExplore) {
            ExploreView()
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Login Failed"), message: Text("Invalid email or password"), dismissButton: .default(Text("OK")))
        }
    }
}

extension LoginView {
    
    // MARK: - Components
    // title
    var header: some View {
        HStack {
            Text("Welcome Back\nKenvin")
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
    
    // email text field
    var emailTextfield: some View {
        VStack {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    // password text field
    var passwordTextfield: some View {
        VStack {
            SecureField("Password", text: $password)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    // login button to go to next screen
    var loginButton: some View {
        Button(action: {
            if DatabaseManager.shared.verifyUser(email: email, password: password) {
                loginStatusMessage = "Login Successful!"
                showSuccessMessage = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showSuccessMessage = false
                    sharedData.screen = .explore // Navigate to ExploreView first
                    navigateToExplore = true
                }
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
    
    // button for signup
    var thisIsNotMeButton: some View {
        NavigationLink {
            SignupView()
        } label: {
            Text("Oh no, this isn't me")
        }
    }
    
    // social login buttons container view
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
        .environment(SharedData())
}
