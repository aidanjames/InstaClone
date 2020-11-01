//
//  StoriesListView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct StoriesListView: View {
    @ObservedObject var viewModel: FeedViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom) {
                SignedOnUserStoryListView(user: viewModel.signedOnUser!)
                ForEach(DataUniverse.shared.fetchUsersForIds(viewModel.signedOnUser!.following)) { influencer in
                    if !DataUniverse.shared.unseenStories(signedOnUser: viewModel.signedOnUser!, user: influencer).isEmpty {
                        InfluencerStoryListView(signedOnUser: viewModel.signedOnUser!, user: influencer)
                            .onTapGesture {
                                for story in DataUniverse.shared.fetchStoriesForUser(userId: influencer.id) {
                                    viewModel.watchedStory(storyId: story.id)
                                }
                            }
                    }
                }
            }
            .frame(height: 100)
            .padding(.leading, 8)
            .padding(.vertical, 5)
        }
    }
}

struct StoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesListView(viewModel: FeedViewModel(userName: "aidanjames"))
    }
}
