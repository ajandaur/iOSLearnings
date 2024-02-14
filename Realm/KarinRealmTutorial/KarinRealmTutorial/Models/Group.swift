//
//  Group.swift
//  KarinRealmTutorial
//
//  Created by Anmol  Jandaur on 1/12/23.
//

import Foundation
import RealmSwift

final class Group: Object, ObjectKeyIdentifiable {
    // Idenfitiable, ObservableObject
    
    @objc dynamic var _id = ObjectId.generate()
    
    @objc dynamic var name: String = "new"
    
    
    override class func primaryKey() -> String? {
        "_id"
    }
    
    
    // create a main link from Group to Item
    var items = RealmSwift.List<Item>()
}
