//
//  Item.swift
//  KarinRealmTutorial
//
//  Created by Anmol  Jandaur on 1/12/23.
//

import Foundation
import RealmSwift

final class Item: Object, ObjectKeyIdentifiable {
    // Idenfitiable, ObservableObject
    
    @objc dynamic var _id = ObjectId.generate()
    
    @objc dynamic var name: String = Item.randomName()
    
    @objc dynamic var isFavorite: Bool = false
    
    // backlink to group
    
    var group = LinkingObjects(fromType: Group.self, property: "items")
    
    override class func primaryKey() -> String? {
        "_id"
    }
    
    
    static func randomName() -> String {
        let randomNames = ["floor", "monitor", "hair", "tie"]
        return randomNames.randomElement() ?? " new item"
    }
    
    func update(name: String) {
        
        if let realm = self.realm {
            try? realm.write({
                self.name = name
            })
        } else {
            self.name = name
        }
    }
    

    func update(isFavorite: Bool) {
        
        if let realm = self.realm {
            try? realm.write({
                self.isFavorite = isFavorite
            })
        } else {
            self.isFavorite = isFavorite
        }
    }

}
