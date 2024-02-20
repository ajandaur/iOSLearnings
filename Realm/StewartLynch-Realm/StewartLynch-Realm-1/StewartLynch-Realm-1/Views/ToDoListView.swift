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
    @State private var searchFilter = ""
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
                ForEach(toDos.sorted(by: [
                    SortDescriptor(keyPath: "completed"),
                    SortDescriptor(keyPath: "urgency", ascending: false)
                ])) { toDo in
                    ToDoListRow(toDo: toDo)
                }
//                .onDelete(perform: $toDos.remove)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .searchable(
                text: $searchFilter,
                collection: $toDos,
                keyPath: \.name) {
                    ForEach(toDos) { toDo in
                        Text(toDo.name)
                            .searchCompletion(toDo.name)
                    }
                }
        }
        .animation(.default, value: toDos)
        .navigationTitle("Realm ToDos")
    }

}

#Preview {
    ToDoListView()
       
}
