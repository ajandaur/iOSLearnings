//
//  ItemsViewModel.swift
//  KarinRealmTutorial
//
//  Created by Anmol  Jandaur on 1/12/23.
//

import Foundation
import RealmSwift
import Combine

class ItemsViewModel: ObservableObject {
    
    @Published var items = List<Item>()
    //  {
    // didSet { objectWillChange.send() }
    // }
    
    @Published var selectedGroup: Group? = nil
    
    var token: NotificationToken? = nil
    
    var realm: Realm?
    
    init() {
        
        let realm = try? Realm()
        self.realm = realm
        
        if let group = realm?.objects(Group.self).first {
            self.selectedGroup = group
            self.items = group.items
        } else {
            
            // write data to realm
             
            try? realm?.write({
                let group = Group()
                realm?.add(group)
                
                group.items.append(Item())
                group.items.append(Item())
                group.items.append(Item())
            })
            
        }
        
        // read elements from realm object
        
//        let token = selectedGroup?.observe({ [unowned self] (changes) in
//            switch changes {
//            case .error(_): break
//            case .change(_, _): objectWillChange.send()
//            case .deleted: self.selectedGroup = nil
//            }
//        })
        
        token = selectedGroup?.items.observe({ (changes) in
            switch changes {
            case .error(_): break
            case .initial(_): break
            case .update(_, deletions: _, insertions: _, modifications: _):
                self.objectWillChange.send()
            }
        })
        
//        selectedGroup?.publisher(for: \.name).sink(receiveValue: { (name) in
//            
//        })
        
    }
    
    func addNewItem() {
        
        if let realm = selectedGroup?.realm {
            try? realm.write {
                selectedGroup?.items.append(Item())
            }
        }
    }
    
    func delete(at indexSet: IndexSet) {
        
        if let index = indexSet.first,
           let realm = items[index].realm {
            
            try? realm.write({
                realm.delete(items[index])
            })
        }
    }
}
