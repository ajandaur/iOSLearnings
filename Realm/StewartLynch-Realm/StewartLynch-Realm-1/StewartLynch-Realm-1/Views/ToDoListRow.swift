//
//  ToDoListRow.swift
//  StewartLynch-Realm-1
//
//  Created by Anmol  Jandaur on 2/14/24.
//

import SwiftUI
import RealmSwift

struct ToDoListRow: View {
    @ObservedRealmObject var toDo: ToDo
    var body: some View {
        HStack {
            Button {
                $toDo.completed.wrappedValue.toggle()
            } label: {
                Image(systemName: toDo.completed ? "checkmark.circle" : "circle")
            }
            .buttonStyle(.plain)
            TextField("Update ToDo", text: $toDo.name)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Button {
                $toDo.urgency.wrappedValue = toDo.increment()
            } label: {
                Text(toDo.urgency.text)
                    .padding(5)
                    .frame(width: 80)
                    .foregroundColor(Color(.systemBackground))
                    .background(RoundedRectangle(cornerRadius: 10).fill(toDo.urgency.color))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ToDoListRow(toDo: ToDo(name: "Make the bed"))
}
