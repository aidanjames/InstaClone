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
            HStack {
                Image(post.postedBy.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                Text(post.postedBy.userName)
                    .font(.footnote)
                    .bold()
                Spacer()
            }
            .padding(.leading, 10)
            Image(post.postUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(maxWidth: .infinity)
                .frame(height: 450)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 1) {
                HStack(spacing: 18) {
                    Image(systemName: "heart")
                    Image(systemName: "bubble.right")
                    Image(systemName: "paperplane")
                    Spacer()
                    Image(systemName: "bookmark")
                        .padding(.horizontal, 15)
                }
                .font(.title2)
                .padding(.vertical, 7)
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(post.likedBy.count) likes")
                        .bold()
                    HStack(alignment: .bottom, spacing: 3) {
                        Text(post.postedBy.userName)
                            .bold()
                        if let postText = post.postText {
                            Text(postText)
                        }
                    }
                    if let firstComment = post.comments.first {
                        HStack(spacing: 3) {
                            Text(firstComment.commentor.userName)
                                .bold()
                            Text(firstComment.comment)
                        }
                    }
                    if post.comments.count > 2 {
                        Text("View all \(post.comments.count) comments")
                            .foregroundColor(.secondary)
                    }
                    
                    if let lastComment = post.comments.last {
                        HStack(spacing: 3) {
                            Text(lastComment.commentor.userName)
                                .bold()
                            Text(lastComment.comment)
                        }
                    }
                    // Get a proper time for this
                    Text("25 minutes ago")
                        .foregroundColor(.secondary)
                }
                .font(.footnote)
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
