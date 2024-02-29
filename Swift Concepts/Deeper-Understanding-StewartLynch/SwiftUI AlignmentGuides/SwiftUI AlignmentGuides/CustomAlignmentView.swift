//
// Created for SwiftUI AlignmentGuides
// by  Stewart Lynch on 2023-06-03
// Using Swift 5.0
// Running on macOS 13.4
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Or, Twitter, if it still exits: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct CustomAlignmentView: View {
    var body: some View {
            VStack {
                HStack {
                    Text("Country Name").bold()
                    Text("Capital").bold()
                }
                HStack {
                    Text("Canada").bold()
                    Text("Ottawa")
                }
                HStack {
                    Text("United States").bold()
                    Text("Washington DC")
                }
            }
    }
}

struct CustomAlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignmentView()
    }
}
