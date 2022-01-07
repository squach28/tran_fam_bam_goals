//
//  Goal.swift
//  TranFamBamGoals
//
//  Created by Sean Quach on 1/7/22.
//

import Foundation

struct Goal: Hashable, Identifiable {
    var id: String
    var name: String
    var description: String
    var createdOn: Date
    var author: String 
}
