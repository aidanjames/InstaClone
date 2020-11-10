//
//  ProfileViewModel.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 09/11/2020.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    var signedOnUsername: String
    
    @Published private var user: UserProfile
    
    var numberOfPosts: Int { DataUniverse.shared.fetchPostsForSignedOnUser(user).count }
    var numberOfFollowers: Int { user.followers.count }
    var numberOfFollowing: Int { user.following.count }
    var isPrivateProfile: Bool { user.isPrivate }
    var profilePicture: Image { Image(user.imageUrl) }
    var signedOnUser: UserProfile { user }
    

    
    init(signedOnUsername: String) {
        self.signedOnUsername = signedOnUsername
        self.user = DataUniverse.shared.fetchSignedOnUserWith(userName: signedOnUsername)
    }
    
    
}
