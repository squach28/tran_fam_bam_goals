//
//  AuthViewModel.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signUp(email: String, password: String, fullName: String) {
        auth.createUser(withEmail: email, password: password) {
            [weak self] result, error in
            guard result != nil, error == nil else {
                fatalError("Error signing up! \(error?.localizedDescription)")
            }
            
            let initUserDisplayNameRequest = result?.user.createProfileChangeRequest()
            guard initUserDisplayNameRequest != nil else {
                fatalError("Change request wasn't able to be created")
            }
            initUserDisplayNameRequest?.displayName = fullName
            initUserDisplayNameRequest?.commitChanges { error in
                print("Commit changes went wrong!")
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {
            [weak self] result, error in
            guard result != nil, error == nil else {
                fatalError("Something bad happened!!! \(error?.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
        print("logged out!")
    }
    
    func fetchProfileInfo() {
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
        }
    }
    
    func getUserDisplayName() -> String {
        let user = Auth.auth().currentUser
        if let user = user {
            return user.displayName!
        }
        return ""
    }
    
}
