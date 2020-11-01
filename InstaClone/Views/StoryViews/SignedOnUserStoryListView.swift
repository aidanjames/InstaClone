//
//  SignedOnUserStoryListView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 28/10/2020.
//

import SwiftUI

struct SignedOnUserStoryListView: View {
    var user: UserProfile
    
    var body: some View {
        VStack {
            ZStack {
                Image(user.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                if !DataUniverse.shared.unseenStories(signedOnUser: user, user: user).isEmpty {
                    Circle()
                        .stroke(Color.pink, lineWidth: 2)
                        .frame(width: 65, height: 65)
                } else {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        .offset(x: 20, y: 20)
                }

            }
            Text("Your story")
                .font(.caption)
                .frame(maxWidth: 65)
        }
        .padding(.leading, 5)
    }
}

struct SignedOnUserStoryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                SignedOnUserStoryListView(user: DataUniverse.shared.allUsers.first!)
                InfluencerStoryListView(signedOnUser: DataUniverse.shared.allUsers.first!, user: DataUniverse.shared.allUsers[1])
                InfluencerStoryListView(signedOnUser: DataUniverse.shared.allUsers.first!, user: DataUniverse.shared.allUsers[2])
            }

        }
    }
}
