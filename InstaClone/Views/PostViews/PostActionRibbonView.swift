//
//  PostActionRibbonView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct PostActionRibbonView: View {
    var post: Post
    
    var body: some View {
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
    }
}

struct PostActionRibbonView_Previews: PreviewProvider {
    static var previews: some View {
        PostActionRibbonView(post: PreviewMockData.getSignedOnUser().following.first!.posts.first!)
    }
}
