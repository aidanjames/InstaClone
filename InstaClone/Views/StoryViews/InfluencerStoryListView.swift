//
//  InfluencerStoryListView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct InfluencerStoryListView: View {
    var user: UserProfile
    
    var body: some View {
        VStack {
            ZStack {
                Image(user.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                if user.hasUnseenStories {
                    Circle()
                        .stroke(Color.pink, lineWidth: 2)
                        .frame(width: 65, height: 65)
                }
            }
            Text(user.userName)
                .font(.caption)
                .frame(maxWidth: 65)
        }
        .padding(.horizontal, 5)
    }
}

struct InfluencerSotryView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerStoryListView(user: PreviewMockData.getSignedOnUser().following.first!)
    }
}
