//
//  ItemResultView.swift
//  RealmDatabaseKarin
//
//  Created by Anmol  Jandaur on 2/12/23.
//

import SwiftUI
import RealmSwift

struct ItemResultView: View {
    
    @ObservedResults(Item.self) var items
    @ObservedResults(Item.self, filter: NSPredicate(format: "name CONTAINS[c] %@", "y")) var filteredItems
    
    @ObservedResults(Item.self, sortDescriptor: SortDescriptor.init(keyPath: "name", ascending: true)) var sortedItems
    
    @State private var searchText: String = ""
    @State private var isAToZ: Bool = true
    
    var body: some View {
        List {
            
            Toggle("Sort order a to z", isOn: $isAToZ)
            
            Section("all") {
                ForEach(items) { item in
                    ItemRow(item: item)
                }
                .onDelete { indexSet in
                    // delete
                }
            }
            
            Section("sorted") {
                ForEach(sortedItems) { item in
                    ItemRow(item: item)
                }
                
                Section("filtered") {
                    ForEach(filteredItems) { item in
                        ItemRow(item: item)
                    }
                }
                .searchable(text: $searchText)
               
            }
            
        }
    }
}
