//
//  Country.swift
//  Realm Intro-2
//
//  Created by Anmol  Jandaur on 2/14/24.
//

import Foundation
import RealmSwift

class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    // each country has many cities
    @Persisted var cities: List<City> 
    @Persisted var flag = "🏳️"
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
