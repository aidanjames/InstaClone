//
//  GridProfileView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 11/11/2020.
//

import SwiftUI

struct GridProfileView: View {
    
    var posts: [Post]
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(posts) { item in
                Image(item.postUrl)
                    .resizable()
                    .frame(height: 150)
            }
        }
    }
}

struct GridProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GridProfileView(posts: DataUniverse.shared.allPosts)
    }
}
