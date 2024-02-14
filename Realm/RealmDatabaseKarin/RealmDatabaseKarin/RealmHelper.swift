//
//  RealmHelper.swift
//  RealmDatabaseKarin
//
//  Created by Anmol  Jandaur on 2/12/23.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func inMemoryRealm() -> Realm {
        
        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = "preview"
        let realm = try! Realm(configuration: config)
        return realm
        
    }
    
    static func realmWithItems() -> Realm {
        
        let realm = inMemoryRealm()
        
        if realm.objects(Item.self).count == 0 {
            try? realm.write({
                realm.add(Item())
                realm.add(Item())
            })
        }
        
        return realm
    }
}
