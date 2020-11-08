//
//  StoriesListView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct StoriesListView: View {
    @ObservedObject var viewModel: FeedViewModel
    @State private var showingStoriesPlayerView = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom) {
                SignedOnUserStoryListView(user: viewModel.signedOnUser!)
                    .onTapGesture {
                        print("Here")
                        showingStoriesPlayerView = true
//                        for story in DataUniverse.shared.unseenStories(signedOnUser: viewModel.signedOnUser!, user: viewModel.signedOnUser!) {
//                            viewModel.watchedStory(storyId: story)
//                        }
                    }
                    .sheet(isPresented: $showingStoriesPlayerView) {
                        Text("Placeholder for storiesPlayerView")
                    }
                ForEach(DataUniverse.shared.fetchUsersForIds(viewModel.signedOnUser!.following)) { influencer in
                    InfluencerStoryListView(signedOnUser: viewModel.signedOnUser!, user: influencer)
                        .onTapGesture {
                            showingStoriesPlayerView = true
//                            for story in DataUniverse.shared.unseenStories(signedOnUser: viewModel.signedOnUser!, user: influencer) {
//                                viewModel.watchedStory(storyId: story)
//                            }
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
