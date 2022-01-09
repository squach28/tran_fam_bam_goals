//
//  SignUpView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var fullName: String = ""
    @State private var isValidFullName: Bool = false
    @State private var email: String = ""
    @State private var isValidEmail: Bool = false
    @State private var password: String = ""
    @State private var isValidPassword: Bool = false
    @State private var confirmPassword: String = ""
    @State private var isMatchingPasswords: Bool = false
    @ObservedObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
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
                        .onChange(of: fullName) {
                            newValue in
                            isValidFullName = !fullName.isEmpty
                        }
                    validationIcon(isValid: isValidFullName)
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
                        .onChange(of: email) {
                            newValue in
                            isValidEmail = validateEmail(email)
                        }
                    validationIcon(isValid: isValidEmail)
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
                        .onChange(of: password) {
                            newValue in
                            isValidPassword = password.count >= 6
                        }
                    validationIcon(isValid: isValidPassword)
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
                        .onChange(of: confirmPassword) {
                            newValue in
                            isMatchingPasswords = password == confirmPassword
                        }
                    validationIcon(isValid: isMatchingPasswords)
                    
                }
                .overlay(RoundedRectangle(cornerRadius: 0).stroke(.gray, lineWidth: 0))
                .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                .overlay(Divider(), alignment: .bottom)
                
                Label {
                    Text("Password must be 6 characters or longer")
                        .font(.caption)
                } icon: {
                    validationIcon(isValid: isValidPassword)
                }
                
                
                Button(action: {
                    guard !fullName.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
                        return
                    }
                    
                    guard isValidEmail else {
                        return
                    }
                    
                    guard isValidPassword else {
                        return
                    }
                    
                    guard isMatchingPasswords else {
                        return
                    }
                    authViewModel.signUp(email: email,password: password, fullName: fullName)
                    print(authViewModel.isSignedIn)
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Sign Up")
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
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: email)
    }
    
    func validationIcon(isValid: Bool) -> some View {
        if isValid {
            return AnyView(                Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(maxWidth: 25, maxHeight: 25)
                                           
                                            .padding()
            )
        } else {
            return AnyView(
                Image(systemName: "x.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(maxWidth: 25, maxHeight: 25)
                    .foregroundColor(.red)
                    .padding()
                
            )
            
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        SignUpView(authViewModel: authViewModel)
    }
}
