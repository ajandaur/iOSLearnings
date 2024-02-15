//
//  ToDo.swift
//  StewartLynch-Realm-1
//
//  Created by Anmol  Jandaur on 2/12/24.
//

import Foundation
import RealmSwift
import SwiftUI

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
        
        var color: Color {
            switch self {
            case .trivial:
                return .teal
            case .neutral:
                return .secondary
            case .urgent:
                return .red
            }
        }

    }
    
    
    func increment() -> Urgency {
        switch urgency {
        case .trivial:
            return .neutral
        case .neutral:
            return .urgent
        case .urgent:
            return .trivial
        }
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
