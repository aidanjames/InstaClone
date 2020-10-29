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
        return postsToReturn.sorted { $0.date > $1.date }
    }
    
    
    func tappedLikeButton(for post: Post) {
        if signedOnUserAlreadyLikesPost(post: post) {
            if let index = signedOnUser!.likes.firstIndex(where: { $0.id == post.id }) {
                signedOnUser!.likes.remove(at: index)
                if let influencerIndex = signedOnUser!.following.firstIndex(where: { $0.id == post.postedBy.id }) {
                    if let postIndex = signedOnUser!.following[influencerIndex].posts.firstIndex(where: { $0.id == post.id }) {
                        if let likedByIndex = signedOnUser!.following[influencerIndex].posts[postIndex].likedBy.firstIndex(where: { $0.id == signedOnUser!.id } ) {
                            signedOnUser!.following[influencerIndex].posts[postIndex].likedBy.remove(at: likedByIndex)
                        }
                    }
                }
            }
        } else {
            signedOnUser!.likes.append(post)
            if let influencerIndex = signedOnUser!.following.firstIndex(where: { $0.id == post.postedBy.id }) {
                if let postIndex = signedOnUser!.following[influencerIndex].posts.firstIndex(where: { $0.id == post.id }) {
                    signedOnUser!.following[influencerIndex].posts[postIndex].likedBy.append(signedOnUser!)
                }
            }
        }
    }
    
    func doubleTapped(post: Post) {
        
        guard !signedOnUserAlreadyLikesPost(post: post) else { return }
        
        if let influencerIndex = signedOnUser!.following.firstIndex(where: { $0.id == post.postedBy.id }) {
            if let postIndex = signedOnUser!.following[influencerIndex].posts.firstIndex(where: { $0.id == post.id }) {
                signedOnUser!.following[influencerIndex].posts[postIndex].likedBy.append(signedOnUser!)
                signedOnUser!.likes.append(post)
            }
        }
    }
    
    func signedOnUserAlreadyLikesPost(post: Post) -> Bool {
        if let influencerIndex = signedOnUser!.following.firstIndex(where: { $0.id == post.postedBy.id }) {
            if let postIndex = signedOnUser!.following[influencerIndex].posts.firstIndex(where: { $0.id == post.id }) {
                return signedOnUser!.following[influencerIndex].posts[postIndex].likedBy.contains(where: { $0.id == signedOnUser!.id })
            }
        }
        return false
    }
}
