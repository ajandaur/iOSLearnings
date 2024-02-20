//
//  City.swift
//  Realm Intro-2
//
//  Created by Anmol  Jandaur on 2/17/24.
//

import Foundation
import RealmSwift

class City: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted(originProperty: "cities") var country: LinkingObjects<Country>
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
