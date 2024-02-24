//
// Created for SwiftUI PreferenceKeys
// by  Stewart Lynch on 2023-05-11
// Using Swift 5.0
// Running on macOS 13.3
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct PreferenceKey3View: View {
    @State private var total: Int = 0
    var scores: [Int] = [10, 14, 28, 56, 32]
    var body: some View {
        VStack {
            List(scores, id:\.self) { score in
                Text("Score \(score)")
            }
            Text("Total: \(total)")
        }
    }
}

struct PreferenceKey3View_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKey3View()
    }
}
