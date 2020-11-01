//
//  PosterProfileView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct PosterProfileView: View {
    var signedOnUser: UserProfile
    var post: Post
    var viewModel: FeedViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Image(DataUniverse.shared.fetchUserWithId(post.postedBy).imageUrl)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        for story in DataUniverse.shared.fetchStoriesForUser(userId: post.postedBy) {
                            viewModel.watchedStory(storyId: story.id)
                        }
                    }
                if !DataUniverse.shared.unseenStories(signedOnUser: signedOnUser, user: DataUniverse.shared.fetchUserWithId(post.postedBy)).isEmpty {
                    Circle()
                        .stroke(Color.pink, lineWidth: 2)
                        .frame(width: 45, height: 45)
                }
            }
            
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
        PosterProfileView(signedOnUser: DataUniverse.shared.allUsers.first!, post: DataUniverse.shared.allPosts[0], viewModel: FeedViewModel(userName: "aidanjames"))
    }
}
