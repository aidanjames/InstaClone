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
    @Published var storiesToView = [[Post]]() // The nested array will be stories for a single user, whether they've been seen or not. The user to present first in the array should be the one with the most recently posted unseen story
    
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
    
    func addMockStory() {
        let randomNumber = Int.random(in: 0...2)
        let newPost = Post(postedBy: DataUniverse.shared.allUsers[randomNumber].id, postType: .story, postUrl: "")
        DataUniverse.shared.addPostForUser(user: DataUniverse.shared.allUsers[randomNumber], post: newPost)
        updateUi()
    }
    
    func sortStoriesForFeed() {
        // 1. Create a variable of type [[Post]]
        // 2. Fetch an array of all Posts of type .story and assign to a new array of type [Post]
        // 3. Find the most recently created unseen story and identify the associated UserProfile
        // 4. Get all stories for the UserProfile from 3 and populate into a new array of [Post], append this to the [[Popst]] array created in 1
        // 5. Remove all these stories from the [Post] array in 2
        // 6. Repeat steps 3-5 while array from 2 !.isEmpty
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
