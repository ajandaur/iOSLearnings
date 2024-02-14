//
//  DetailItemView.swift
//  KarinRealmTutorial
//
//  Created by Anmol  Jandaur on 2/5/23.
//

import SwiftUI

struct DetailItemView: View {
    
    let item: Item
    
    @State private var name: String = ""
    
    @Environment(\.presentationMode) var presentation
    
    
    // Using custom binding with a getter and setter to change the value of the data itself
    private var isFavorite: Binding<Bool> {
        Binding<Bool> {
            item.isFavorite
        } set: { value in
            item.update(isFavorite: value)
        }

    }
    
    var body: some View {
        VStack {
            
            Text("Edit item name")
            
            TextField("edit", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle(isOn: isFavorite) {
                Text("select as favorite")
            }
            Button {
                // Save
                item.update(name: name)
                presentation.wrappedValue.dismiss()
            } label: {
                Text("save")
            }

        }
        .padding()
        .onAppear {
            name = item.name
        }
        
        .onReceive(item.publisher(for: \.isFavorite)) { newValue in
            print("updated is favorite to \(newValue)")
        }
    }
}

struct DetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemView(item: Item())
    }
}
