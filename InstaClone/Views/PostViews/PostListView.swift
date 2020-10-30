//
//  PostListView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: FeedViewModel
    var post: Post
    @State private var heartScale: CGFloat = 0
    
    var body: some View {
        VStack {
            PosterProfileView(post: post)
            ZStack {
                Image(post.postUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture(count: 2) {
                        viewModel.doubleTapped(post: post)
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 2)) {
                            heartScale = 2
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                heartScale = 0
                            }
                        }
                }
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .scaleEffect(heartScale)
                
            }
            VStack(alignment: .leading, spacing: 1) {
                PostActionRibbonView(viewModel: viewModel, post: post)
                PostCommentsView(post: post)
            }
            .padding(.leading, 10)
        }
        .padding(.bottom, 10)
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(viewModel: FeedViewModel(), post: PreviewMockData.getSignedOnUser().following.first!.posts.first!)
    }
}
