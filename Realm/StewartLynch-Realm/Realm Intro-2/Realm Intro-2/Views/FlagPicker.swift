//
//  FlagPicker.swift
//  Realm Intro-2
//
//  Created by Anmol  Jandaur on 2/19/24.
//

import SwiftUI
import RealmSwift

struct FlagPicker: View {
    @ObservedRealmObject var country: Country
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    var searchResults: [CountryInfo] {
        if searchText.isEmpty {
            return CountryInfo.array
        } else {
            return CountryInfo.array.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { countryInfo in
                    Button {
                        $country.flag.wrappedValue = countryInfo.flag
                        dismiss()
                    } label: {
                        HStack {
                            Text("\(countryInfo.name) \(countryInfo.flag)")
                            Spacer()
                            if country.flag == countryInfo.flag {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Flags")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                    }

                }
            }
        }
    }
}
