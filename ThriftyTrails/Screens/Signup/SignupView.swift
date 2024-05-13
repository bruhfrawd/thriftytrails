//
//  Signupview.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 05/05/24.
//

import SwiftUI

struct SignupView: View {
    
    // MARK: - Properties
    
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""

    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            header
                .padding(.bottom)
            emailTextfield
            usernameTextfield
            passwordTextfield
            signupButton
        }
        .padding(.horizontal)
    }
}

extension SignupView {
    
    // MARK: - Components
    
    // title
    var header: some View {
        HStack {
            Text("New\nAccount")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Circle()
                    .fill()
                    .frame(width: 80)
                    .overlay {
                        Image(systemName: "camera")
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
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    // username text field
    var usernameTextfield: some View {
        VStack {
            TextField("Username", text: $username)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    // password text field
    var passwordTextfield: some View {
        VStack {
            TextField("Password", text: $password)
            Rectangle()
                .frame(height: 0.5)
        }
    }
    
    // signup button for moving on to next screen
    var signupButton: some View {
        Button(action: {
        }, label: {
            Text("Signup")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.default)
                .clipShape(.rect(cornerRadius: 16))
        })
    }
}

#Preview {
    SignupView()
}
