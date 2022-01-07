//
//  GoalViewModel.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import Foundation
import Firebase

class GoalViewModel: ObservableObject {
    
    @Published var listOfGoals = [Goal]()
    
    /*    func getGoals() {
        let db = Firestore.firestore()
        
        db.collection("goals").getDocuments {
            snapshot, error in
            // check for errors
            guard error == nil else {
                fatalError("Error with Firestore \(error.debugDescription)")
            }
            
            if let snapshot = snapshot {
                
                DispatchQueue.main.async {
                self.listOfGoals = snapshot.documents.map {
                    document in
                    return Goal(id: document.documentID, name: document["name"] as? String ?? "", description: document["description"] as? String ?? "")
                }
                }
            }
            
        }
    } */
    
    
    // TODO insert a goal into the datbase
    
    func addGoal(name: String, description: String) {
        
    }
    
    // TODO get a goal based on id 
}
