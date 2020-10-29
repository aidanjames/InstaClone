//
//  PostActionRibbonView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct PostActionRibbonView: View {
    @ObservedObject var viewModel: FeedViewModel
    var post: Post
    
    var userLikesPost: Bool {
        viewModel.signedOnUser!.likes.contains { $0.id == post.id }
    }
    
    var body: some View {
        HStack(spacing: 18) {
            Button(action: {
                viewModel.tappedLikeButton(for: post)
            } ) {
                Image(systemName: userLikesPost  ? "heart.fill" : "heart")
                    .foregroundColor(userLikesPost  ? .red : .primary)
            }
            Image(systemName: "bubble.right")
            Image(systemName: "paperplane")
            Spacer()
            Image(systemName: "bookmark")
                .padding(.horizontal, 15)
        }
        .font(.title2)
        .padding(.vertical, 7)
    }
}

struct PostActionRibbonView_Previews: PreviewProvider {
    static var previews: some View {
        PostActionRibbonView(viewModel: FeedViewModel(), post: PreviewMockData.getSignedOnUser().following.first!.posts.first!)
    }
}
