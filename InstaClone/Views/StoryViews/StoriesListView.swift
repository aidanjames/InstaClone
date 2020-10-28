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
                ForEach(viewModel.signedOnUser!.following) { influencer in
                    if influencer.hasUnseenStories {
                        InfluencerStoryListView(user: influencer)
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
        StoriesListView(viewModel: FeedViewModel())
    }
}
