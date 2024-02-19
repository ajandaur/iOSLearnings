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
    var body: some View {
        HStack {
            TextField("New Country", text: $country.name)
                .focused($isFocused, equals: true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .frame(height: 30)
            Spacer()
            Text("\(country.cities.count)")
        }
    }
}

#Preview {
    CountryRowView(country: Country(name: "Canada"))
}
