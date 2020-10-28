//
//  PostListView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import SwiftUI

struct PostListView: View {
    var post: Post
    
    var body: some View {
        VStack {
            PosterProfileView(post: post)
            Image(post.postUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 1) {
                PostActionRibbonView(post: post)
                PostCommentsView(post: post)
            }
            .padding(.leading, 10)
        }
        .padding(.bottom, 10)
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(post: PreviewMockData.getSignedOnUser().following.first!.posts.first!)
    }
}
