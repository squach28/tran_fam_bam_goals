//
//  TranFamBamGoalsApp.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import SwiftUI
import Firebase

@main
struct TranFamBamGoalsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
