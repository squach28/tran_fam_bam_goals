//
//  SplashScreenView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Tran Fam Bam Goals")
                    .font(.title)
                    .fontWeight(.bold)
                Image("goal")
                    .resizable()
                    .padding()
                

                    NavigationLink(destination:SignUpView(authViewModel: authViewModel)) {
                        Text("Get Started")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hue: 0.712, saturation: 0.444, brightness: 0.951))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Back")
                    .navigationBarHidden(true)
                    
                    
                    
                NavigationLink(destination: SignInView(authViewModel: authViewModel)) {
                        Text("Sign In")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.179, green: 0.189, blue: 0.21))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding()
                    }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Back")
                .navigationBarHidden(true)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .preferredColorScheme(.dark)
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        SplashScreenView(authViewModel: authViewModel)
        
        SplashScreenView(authViewModel: authViewModel)
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        
    }
}
