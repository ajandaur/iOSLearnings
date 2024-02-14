//
//  ItemsListView.swift
//  KarinRealmTutorial
//
//  Created by Anmol  Jandaur on 2/4/23.
//

import SwiftUI
import RealmSwift

struct ItemsListView: View {
    
    @StateObject var itemViewModel = ItemsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Items")
                    .font(.title)
                
                List {
                    // List has frozen items 
                    ForEach(itemViewModel.items.freeze()) { item in
                        
                        NavigationLink {
                            DetailItemView(item: (itemViewModel.realm?.resolve(ThreadSafeReference(to: item)))!)
                        } label: {
                            HStack {
                                Text(item.name)
                                if item.isFavorite {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                }
                              
                            }
                            
                        }

                        Text(item.name)
                    }
                    .onDelete { indexSet in
                        itemViewModel.delete(at: indexSet)
                    }
                }
            }
            .navigationTitle("Items")
            .navigationBarItems(trailing:
                                    Button(action: {
                itemViewModel.addNewItem()
            }, label: {
                Image(systemName: "plus")
            }))
        }
     
       
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView()
    }
}
