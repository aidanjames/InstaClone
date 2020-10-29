//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var signedOnUser: UserProfile?
    
    init() { signedOnUser = PreviewMockData.getSignedOnUser() }
    
    func getPostsForFeed() -> [Post] {
        var postsToReturn = [Post]()
        
        if let user = self.signedOnUser {
            for influencer in user.following {
                for post in influencer.posts.filter({ $0.postType == .photo || $0.postType == .video }) {
                    postsToReturn.append(post)
                }
            }
        }
        
        return postsToReturn.sorted { $0.date < $1.date }
    }
    
}
