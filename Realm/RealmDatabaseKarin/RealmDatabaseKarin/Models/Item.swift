//
//  Item.swift
//  RealmDatabaseKarin
//
//  Created by Anmol  Jandaur on 2/10/23.
//

import Foundation
import RealmSwift

final class Item: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = "\(randomAdjectives.randomElement()!) \(randomNouns.randomElement()!)"
    @Persisted var isFavorite = false
    
    @Persisted(originProperty: "items") var group: LinkingObjects<Group>
    
    convenience init(name: String, isFavorite: Bool) {
        self.init()
        self.name = name
        self.isFavorite = isFavorite
    }
    
    static func previewExample() -> Item {
        Item(name: "fluffy preview", isFavorite: true)
    }
    

}

// random adjectives for more interesting demo item names
let randomAdjectives = [
    "fluffy", "classy", "bumpy"
]

let randomNouns = [
    "floor", "monitor", "hair tie"
]
