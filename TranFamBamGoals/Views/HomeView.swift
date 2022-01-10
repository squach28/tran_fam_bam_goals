//
//  HomeView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @State private var showGoalForm: Bool = false
    @State private var showProfileForm: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    authViewModel.signOut()
                }) {
                    Text("Sign Out")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .toolbar() {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        showProfileForm.toggle()
                    }) {
                        Image(systemName: "person.fill")
                    }
                    .sheet(isPresented: $showProfileForm, onDismiss: {
                            print(showProfileForm)
                    }) {
                        ProfileFormView(authViewModel: authViewModel)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showGoalForm.toggle()
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                    .sheet(isPresented: $showGoalForm) {
                        GoalFormView()
                    }
                }
                
            }
        }
        .preferredColorScheme(.dark)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        HomeView(authViewModel: authViewModel)
    }
}
