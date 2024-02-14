//
//  ItemDetailView.swift
//  RealmDatabaseKarin
//
//  Created by Anmol  Jandaur on 2/10/23.
//

import SwiftUI
import RealmSwift

struct ItemDetailView: View {
    
    // @ObservedObject
    @ObservedRealmObject var item: Item
    
    @Environment(\.realm) var realm
    @Environment(\.realmConfiguration) var config
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter a new name:")
            
            
            TextField("New name", text: $item.name)
                .textFieldStyle(.roundedBorder)
            
        }
        .navigationTitle(item.name)
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Toggle(isOn: $item.isFavorite) {
                    Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                    if let newItem = item.thaw(), let realm = newItem.realm {
                        
                        try? realm.write {
                            realm.delete(newItem)
                        }
                        
                    }
                    
                } label: {
                    Text("Delete")
                }
                .padding()
                
            }
        }

    }
}

