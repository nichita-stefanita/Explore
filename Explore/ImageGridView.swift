//
//  ImageGridView.swift
//  Explore
//
//  Created by Nichita Stefanita on 7/13/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageGridView: View {
    
    
    @ObservedObject var randomImages = UnsplashData()
    
    var columns = [
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(randomImages.photoArray, id: \.id) { photo in
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 200)
                        .clipped()
                }
            }.padding()
        }.navigationTitle("Image grid")
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}
