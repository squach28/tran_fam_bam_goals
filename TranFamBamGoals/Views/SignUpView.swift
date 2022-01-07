//
//  SignUpView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @ObservedObject var authViewModel: AuthViewModel
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("wave-haikei")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                Text("Create an Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.bottom, 80)
                
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .padding()
                    TextField("Full Name", text: $fullName)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                }
                .overlay(RoundedRectangle(cornerRadius: 0).stroke(.gray, lineWidth: 0))
                .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                .overlay(Divider(), alignment: .bottom)
                
                HStack {
                    Image(systemName: "mail.fill")
                        .resizable()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .padding()
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                }
                .overlay(RoundedRectangle(cornerRadius: 0).stroke(.gray, lineWidth: 0))
                .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                .overlay(Divider(), alignment: .bottom)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .padding()
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                }
                .overlay(RoundedRectangle(cornerRadius: 0).stroke(.gray, lineWidth: 0))
                .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                .overlay(Divider(), alignment: .bottom)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .padding()
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                }
                .overlay(RoundedRectangle(cornerRadius: 0).stroke(.gray, lineWidth: 0))
                .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                .overlay(Divider(), alignment: .bottom)
                
                
                Button("Sign Up", action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    authViewModel.signUp(email: email,password: password)
                    
                })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                    .padding(.top, 40)
                    .shadow(radius: 5)
                
                
            }
            .padding()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        SignUpView(authViewModel: authViewModel)
    }
}
