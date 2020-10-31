//
//  PosterProfileView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct PosterProfileView: View {
    var post: Post
    
    var body: some View {
        HStack {
            Image(DataUniverse.shared.fetchUserWithId(post.postedBy).imageUrl)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            Text(DataUniverse.shared.fetchUserWithId(post.postedBy).userName)
                .font(.footnote)
                .bold()
            Spacer()
        }
        .padding(.leading, 10)
    }
}

struct PosterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PosterProfileView(post: DataUniverse.shared.allPosts[0])
    }
}
