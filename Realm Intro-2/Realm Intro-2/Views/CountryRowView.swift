//
//  CountryRowView.swift
//  Realm Intro-2
//
//  Created by Anmol  Jandaur on 2/18/24.
//

import SwiftUI
import RealmSwift

struct CountryRowView: View {
    @ObservedRealmObject var country: Country
    @FocusState var isFocused: Bool?
    @State private var showFlagPicker = false
    var body: some View {
        HStack {
            Button {
                showFlagPicker = true
            } label: {
                Text(country.flag)
            }
            .buttonStyle(.plain)
            TextField("New Country", text: $country.name)
                .focused($isFocused, equals: true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .frame(height: 30)
                .sheet(isPresented: $showFlagPicker) {
                    FlagPicker(country: country)
                }
            Spacer()
            Text("\(country.cities.count)")
        }
    }
}

#Preview {
    CountryRowView(country: Country(name: "Canada"))
}
