//
//  ItemListView.swift
//  RealmDatabaseKarin
//
//  Created by Anmol  Jandaur on 2/10/23.
//

import SwiftUI
import RealmSwift

struct ItemListView: View {
    
    
    // Alternative to @State
    @ObservedRealmObject var group: Group
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(group.items) { item in
                    ItemRow(item: item)
                }
                .onMove(perform: $group.items.move)
                .onDelete(perform: $group.items.remove)
            }
            
            .listStyle(GroupedListStyle())
            .navigationTitle("Items")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        $group.items.append(Item())
                    } label: {
                        Image(systemName: "plus")
                    }.frame(maxWidth: .infinity, alignment: .trailing)

                }
            }
        }
     
    }
}

struct ItemRow: View {
    
    @ObservedRealmObject var item: Item
    
    var body: some View {
        
        NavigationLink {
            ItemDetailView(item: item)
        } label: {
            Text(item.name)
            if item.isFavorite {
                Image(systemName: "heart.fill")
            }
        }

    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(group: Group())
    }
}
