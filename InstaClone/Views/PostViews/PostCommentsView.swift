//
//  PostCommentsView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct PostCommentsView: View {
    var post: Post
    
    var body: some View {
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
}

struct PostCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        PostCommentsView(post: PreviewMockData.getSignedOnUser().following.first!.posts.first!)
    }
}
