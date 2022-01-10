//
//  ProfileFormView.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/9/22.
//

import SwiftUI

struct ProfileFormView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @State private var name = "Sean Quach"
    @State private var email = "squach3443@gmail.com"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    Picker("My Profile", selection: $name) {
                        
                        /*
                        TextField("Name", text: $name)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationTitle("Name")
                            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                    Button(action: {}) {
                                        Text("Done")
                                    }
                                }
                            } */
                    }
                   
                }
            }
            .navigationTitle("Me")// end of Form
        }
        .preferredColorScheme(.dark)
    }
    
}

struct ProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        ProfileFormView(authViewModel: authViewModel)
    }
}
