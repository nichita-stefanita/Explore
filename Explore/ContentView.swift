//
//  ContentView.swift
//  Explore
//
//  Created by Nichita Stefanita on 7/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var randomImages = UnsplashData()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(randomImages.photoArray, id: \.id) { photo in 
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 200, alignment: .center)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
