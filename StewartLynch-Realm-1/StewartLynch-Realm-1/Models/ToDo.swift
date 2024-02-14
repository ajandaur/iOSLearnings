//
//  ToDo.swift
//  StewartLynch-Realm-1
//
//  Created by Anmol  Jandaur on 2/12/24.
//

import Foundation
import RealmSwift

class ToDo: Object, ObjectKeyIdentifiable {
    // Use primary key for upserting an object
    // can only have one primary property in a model
    @Persisted(primaryKey: true) var id: ObjectId
    // making a property as presisted will make it a default value
    @Persisted var name: String
    @Persisted var completed = false
    @Persisted var urgency: Urgency = .neutral
    
    enum Urgency: Int, PersistableEnum {
        case trivial, neutral, urgent
        
        var text: String {
            switch self {
            case .trivial:
                return "Trivial"
            case .neutral:
                return "Neutral"
            case .urgent:
                return "Urgent"
            }
        }
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
