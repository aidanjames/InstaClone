//
//  SignedOnUserImageView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 11/11/2020.
//

import SwiftUI

struct SignedOnUserImageView: View {
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
            Text(user.name)
                .font(.caption2)
                .bold()
                .frame(maxWidth: 85)
                .lineLimit(1)
        }
        .padding(.leading, 5)
    }
}

struct SignedOnUserImageView_Previews: PreviewProvider {
    static var previews: some View {
        SignedOnUserImageView(user: DataUniverse.shared.allUsers.first!)
    }
}
