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
            if !post.likes.isEmpty {
                Text("\(post.likes.count) \(post.likes.count == 1 ? "like" : "likes")")
                    .bold()
            }
            Group {
                Text(DataUniverse.shared.fetchUserWithId(post.postedBy).userName)
                    .bold()
                    + Text(" \(post.postText ?? "")")
            }.lineLimit(2)
            
            if let firstComment = DataUniverse.shared.fetchComentsForPost(postId: post.id).first {
                Group {
                    Text(DataUniverse.shared.fetchUserWithId(firstComment.commentor).userName) //firstComment.commentor.userName)
                        .bold()
                        + Text(" \(firstComment.comment)")
                }.lineLimit(2)
            }
            if DataUniverse.shared.fetchComentsForPost(postId: post.id).count > 2 {
                Text("View all \(post.comments.count) comments")
                    .foregroundColor(.secondary)
            }
            
            if let lastComment = DataUniverse.shared.fetchComentsForPost(postId: post.id).last {
                Group {
                    Text(DataUniverse.shared.fetchUserWithId(lastComment.commentor).userName)
                        .bold()
                        + Text(" \(lastComment.comment)")
                }.lineLimit(2)
            }
            Text(Date().timeSince(post.date))
                .foregroundColor(.secondary)

        }
        .font(.footnote)
    }
    
    func calculateDifferenceBetween(date1: Date, date2: Date) -> TimeInterval {
        return date1.timeIntervalSince(date2)
    }
}

struct PostCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        PostCommentsView(post: DataUniverse.shared.allPosts.first!)
    }
}
