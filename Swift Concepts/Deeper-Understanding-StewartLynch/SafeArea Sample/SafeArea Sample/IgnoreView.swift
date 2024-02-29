//
// Created for SafeArea Sample
// by  Stewart Lynch on 2023-05-24
// Using Swift 5.0
// Running on macOS 13.3
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Or, Twitter, if it still exits: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct IgnoreView: View {
    @State private var textEntry = ""
    var body: some View {
        TabView {
            NavigationStack {
                ZStack {
                    Color.red
                        .overlay(alignment: .bottom) {
                            Text("Bottom")
                        }
                        .ignoresSafeArea(edges: .horizontal)
                        .navigationTitle("Safe Areas")
                    TextField("Text Entry", text: $textEntry)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            .tabItem {
                Label("First", systemImage: "1.circle.fill")
            }
        }
    }
}

struct IgnoreView_Previews: PreviewProvider {
    static var previews: some View {
            IgnoreView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
                .previewDisplayName("iPhone 14 Pro")
        IgnoreView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .previewDisplayName("iPhone 14")
        IgnoreView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
                .previewDisplayName("iPhone SE")
        IgnoreView()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad")
        }
}
