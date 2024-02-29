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

struct AlignmentSubscriptsView: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Image(systemName: "1.circle.fill")
                Image(systemName: "2.circle.fill")
                    .alignmentGuide(.bottom, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                Image(systemName: "3.circle.fill")
            }
            .font(.largeTitle)
            Divider()
            
            HStack(alignment: .bottom, spacing: 0) {
                Text("H")
                Text("2").font(.title2)
                    .alignmentGuide(.bottom, computeValue: { dimension in
                        dimension[.bottom] - 5
                    })
                Text("O")
            }
            .font(.largeTitle)
            Divider()
            
            HStack {
                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                        dimension[.bottom]
                    })
                Text("Energy")
                    .font(.largeTitle)
                    .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                        dimension[.firstTextBaseline]
                    })
            }
        }
    }
}

struct AlignmentSubscriptsView_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentSubscriptsView()
    }
}
