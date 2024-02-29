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

struct ZStackViews: View {
    var body: some View {
        VStack {
            ZStack(alignment: .leading){
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                   Rectangle()
                    .frame(width: 75, height: 50)
                    .foregroundColor(.blue)
                    .alignmentGuide(.leading, computeValue: { _ in
                        return 50
                    })
            }
            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .alignmentGuide(.top, computeValue: { dimension in
                        -50
                    })
                Rectangle()
                    .frame(width: 50, height: 75)
                    .foregroundColor(.blue)

            }
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                Rectangle()
                    .frame(width: 50, height: 75)
                    .foregroundColor(.blue)
                    .alignmentGuide(HorizontalAlignment.center, computeValue: { dimension in
                        75
                    })
                    .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                        75
                    })
            }
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                Rectangle()
                    .frame(width: 75, height: 50)
                    .foregroundColor(.blue)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        50
                    })
            }
        }
    }
}

struct ZStackViews_Previews: PreviewProvider {
    static var previews: some View {
        ZStackViews()
    }
}

