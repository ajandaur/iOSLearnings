//
//  StewartLynch_Realm_1App.swift
//  StewartLynch-Realm-1
//
//  Created by Anmol  Jandaur on 2/12/24.
//

import SwiftData
import SwiftUI

@main
struct StewartLynch_Realm_1App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ToDoListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
