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

struct InsetsView: View {
    @State private var todos: [String] = Array(repeating: "Todo", count: 50).enumerated().map {"\($1) \($0)"}
        var body: some View {
            List(todos, id: \.self) { todo in
                Text(todo)
            }
            .listStyle(.plain)
        }
}

struct InsetsView_Previews: PreviewProvider {
    static var previews: some View {
        InsetsView()
    }
}
