//
//  ContentView.swift
//  StewartLynch-Realm-1
//
//  Created by Anmol  Jandaur on 2/12/24.
//

import SwiftUI
import SwiftData
import RealmSwift

struct ToDoListView: View {
    @ObservedResults(ToDo.self) var toDos
    @State private var name = ""
    @FocusState private var focus: Bool?

    var body: some View {
        VStack {
            HStack {
                TextField("New ToDo", text: $name)
                    .focused($focus, equals: true)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                Button {
                    let newToDo = ToDo(name: name)
                    $toDos.append(newToDo)
                    name = ""
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .padding()
            List() {
                ForEach(toDos) { toDo in
                    Text(toDo.name)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Realm ToDos")
    }

}

#Preview {
    ToDoListView()
       
}
