//
//  ContentView.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI
import RealmSwift

struct CountriesListView: View {
    @ObservedResults(Country.self) var countries
    @FocusState private var isFocused: Bool?
    @State private var presentAlert = false
    var body: some View {
        NavigationStack {
            VStack {
                if countries.isEmpty {
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) button above the to create a new Coutnry")
                } else {
                    List {
                        ForEach(countries.sorted(byKeyPath: "name")) { country in
                            NavigationLink {
                                CitiesListView(country: country)
                            } label: {
                                CountryRowView(country: country, isFocused: _isFocused)
                            }
                        }
                        .onDelete(perform: deleteCountry)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .animation(.default, value: countries)
            .navigationTitle("Countries")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        $countries.append(Country())
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button {
                            isFocused = nil
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }

                    }
                }
            }
        }
        .alert("You must first delete all of teh cities in this country.", isPresented: $presentAlert, actions: {})
    }
    func deleteCountry(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let selectedCountry = Array(countries.sorted(byKeyPath: "name"))[index]
        guard selectedCountry.cities.isEmpty else {
            presentAlert.toggle()
            return
        }
        $countries.remove(selectedCountry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
