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

struct PreferenceKey4View: View {
    var strings = ["Something", "Something Bigger", "Small"]
    var body: some View {
        VStack {
            ForEach(strings, id: \.self) { string in
                Text(string)
            }
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300, height: 2)
                .padding()
        }
     }
}

struct PreferenceKey4View_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKey4View()
    }
}
