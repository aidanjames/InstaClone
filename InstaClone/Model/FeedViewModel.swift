//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    var userName: String
    var signedOnUser: UserProfile?
    @Published var postsForMainFeed = [Post]()
    @Published var commentsForMainFeed = [PostComment]()
    @Published var postsForStoriesFeed = [Post]()
    
    init(userName: String) {
        self.userName = userName
        updateUi()
    }

    func tappedLikeButton(for post: Post) {
        let commonLike = post.likes.intersection(signedOnUser!.likes)
        
        guard commonLike.isEmpty else {
            DataUniverse.shared.deleteLike(likeId: commonLike.first!)
            updateUi()
            return
        }
        DataUniverse.shared.addLike(userId: signedOnUser!.id, postId: post.id)
        updateUi()
    }
    
    func doubleTappedPost(_ post: Post) {
        let commonLike = post.likes.intersection(signedOnUser!.likes)
        
        guard commonLike.isEmpty else { return }
        DataUniverse.shared.addLike(userId: signedOnUser!.id, postId: post.id)
        updateUi()
    }
    
    func watchedStory(storyId: UUID) {
        DataUniverse.shared.hasWatchedStory(signedOnUser: signedOnUser!, story: storyId)
        updateUi()
    }
    
    func updateUi() {
        signedOnUser = DataUniverse.shared.fetchSignedOnUserWith(userName: userName)
        guard let signedOnUser = signedOnUser else { return }
        let postsForUser = DataUniverse.shared.fetchAllAvailablePostsForSignedOnUser(signedOnUser)
        postsForMainFeed = postsForUser.filter { $0.postType != .story }
        postsForStoriesFeed = postsForUser.filter { $0.postType == .story}.sorted { $0.date > $1.date }
        commentsForMainFeed = DataUniverse.shared.fetchAllAvailableCommentsForPosts(postsForMainFeed)
    }
}
