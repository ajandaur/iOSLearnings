//
//  Group.swift
//  RealmDatabaseKarin
//
//  Created by Anmol  Jandaur on 2/10/23.
//

import Foundation
import RealmSwift

final class Group: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    // create a relationship to Item
    
    @Persisted var items = RealmSwift.List<Item>()
    
}
