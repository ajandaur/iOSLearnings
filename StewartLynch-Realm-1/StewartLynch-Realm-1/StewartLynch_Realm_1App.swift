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
   

    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstrainsBasedLayoutLogUnsatisfiable")
                }
            
        }
    }
}
