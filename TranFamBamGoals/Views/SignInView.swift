//
//  SignInView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @ObservedObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("layered-waves-haikei")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.bottom, 125)
                
                
                
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
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    authViewModel.signIn(email: email,password: password)
                    self.presentationMode.wrappedValue.dismiss()
                    
                    
                }) {
                    Text("Sign In")
                        .font(.title2)
                        .fontWeight(.bold)
                }
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        SignInView(authViewModel: authViewModel)
    }
}
