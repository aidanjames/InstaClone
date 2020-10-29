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
            Group {
                Text(post.postedBy.userName)
                    .bold()
                    + Text(" \(post.postText ?? "")")
            }.lineLimit(2)
            
            if let firstComment = post.comments.first {
                Group {
                    Text(firstComment.commentor.userName)
                        .bold()
                        + Text(" \(firstComment.comment)")
                }.lineLimit(2)
            }
            if post.comments.count > 2 {
                Text("View all \(post.comments.count) comments")
                    .foregroundColor(.secondary)
            }
            
            if let lastComment = post.comments.last {
                Group {
                    Text(lastComment.commentor.userName)
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
        PostCommentsView(post: PreviewMockData.getSignedOnUser().following.first!.posts.first!)
    }
}
