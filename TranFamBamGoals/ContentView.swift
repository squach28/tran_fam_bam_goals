//
//  ContentView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = GoalViewModel()
    @State private var showingPopover = false
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        
        NavigationView {
            if authViewModel.signedIn {
                VStack {
                    Text("You are signed in")
                    Button("Sign Out", action: {
                        authViewModel.signOut()
                    })
                }

            } else {
                VStack(alignment: .leading) {
                    SignUpView(authViewModel: authViewModel)
                }
            }
        }
        .onAppear {
            authViewModel.signedIn = authViewModel.isSignedIn
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
