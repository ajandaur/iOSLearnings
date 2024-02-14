//
//  ContentView.swift
//  RealmDatabaseKarin
//
//  Created by Anmol  Jandaur on 2/6/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    // fetch all group instances of the database
    @ObservedResults(Group.self) var groups
    
    var body: some View {
        if let group = groups.first {
            ItemListView(group: group)
        } else {
            ProgressView()
                .onAppear {
                    $groups.append(Group())
                }
        }
       
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
