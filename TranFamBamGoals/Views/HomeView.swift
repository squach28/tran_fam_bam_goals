//
//  HomeView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        Button(action: {
            authViewModel.signOut()
        }) {
            Text("Sign Out")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        HomeView(authViewModel: authViewModel)
    }
}
