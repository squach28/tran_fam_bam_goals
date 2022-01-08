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
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        if authViewModel.isSignedIn || authViewModel.signedIn {
            HomeView(authViewModel: authViewModel)
        } else {
            SplashScreenView(authViewModel: authViewModel)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
