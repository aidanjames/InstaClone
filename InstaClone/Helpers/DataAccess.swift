//
//  DataAccess.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 31/10/2020.
//

import Foundation


class DataUniverse {
    static let shared = DataUniverse()
    
    var allUsers: [UserProfile] = []
    var allPosts: [Post] = []
    var allComments: [PostComment] = []
    var allLikes: [Like] = []
    
    private init() {
        fetchUsersFromFileManager()
        if allUsers.isEmpty {
            PreviewMockData.createMockData()
            fetchUsersFromFileManager()
        }
    }
    
    
    func fetchUsersFromFileManager() {
        if let users: [UserProfile] = FileManager.default.fetchData(from: "users") { allUsers = users }
        if let posts: [Post] = FileManager.default.fetchData(from: "posts") { allPosts = posts}
        if let comments: [PostComment] = FileManager.default.fetchData(from: "comments") { allComments = comments }
        if let likes: [Like] = FileManager.default.fetchData(from: "likes") { allLikes = likes }
    }
    
    func fetchAllAvailablePostsForSignedOnUser(_ user: UserProfile) -> [Post] {
        var postsToReturn = [Post]()
        
        for userId in user.following {
            if let user = allUsers.first(where: { $0.id == userId } ) {
                for postId in user.posts {
                    if let post = allPosts.first(where: { $0.id == postId } ) {
                        postsToReturn.append(post)
                    }
                }
            }
        }
        return postsToReturn.sorted { $0.date > $1.date }
    }
    
    
    func fetchAllAvailableCommentsForPosts(_ posts: [Post]) -> [PostComment] {
        var commentsToReturn = [PostComment]()
        
        for post in posts {
            for commentId in post.comments {
                if let comment = allComments.first(where: { $0.id == commentId } ) {
                    commentsToReturn.append(comment)
                }
            }
        }
        return commentsToReturn
    }
    
    func fetchSignedOnUserWith(userName: String) -> UserProfile {
        return allUsers.first { $0.userName == userName }!
    }
    
    func addLike(userId: UUID, postId: UUID) {
        let like = Like(liker: userId, postOrComment: postId)
        allLikes.append(like)
        if let userIndex = allUsers.firstIndex(where: { $0.id == userId } ) {
            if let postIndex = allPosts.firstIndex(where: { $0.id == postId }) {
                allUsers[userIndex].likes.insert(like.id)
                allPosts[postIndex].likes.insert(like.id)
            }
        }
        save()
    }
    
    func deleteLike(likeId: UUID) {
        if let likeIndex = allLikes.firstIndex(where: { $0.id == likeId }) {
            if let postIndex = allPosts.firstIndex(where: { $0.id == allLikes[likeIndex].postOrComment } ) {
                allPosts[postIndex].likes.remove(likeId)
            }
            if let userIndex = allUsers.firstIndex(where: { $0.id == allLikes[likeIndex].liker } ) {
                allUsers[userIndex].likes.remove(likeId)
            }
        }
        save()
    }
    
    func unseenStories(signedOnUser: UserProfile, user: UserProfile) -> [UUID] {
        let storiesSet = Set(allPosts.filter { $0.postedBy == user.id }.filter { $0.postType == .story }.map { $0.id }.map { $0 })
        let seenStories = storiesSet.intersection(signedOnUser.seenPosts)
        return Array(storiesSet.subtracting(seenStories))
    }
    
    func hasWatchedStory(signedOnUser: UserProfile, story: UUID) {
        if let userIndex = allUsers.firstIndex(where: { $0.id == signedOnUser.id }) {
            allUsers[userIndex].seenPosts.insert(story)
            save()
        }
    }
    
    func fetchUsersForIds(_ ids: Set<UUID>) -> [UserProfile] {
        return allUsers.filter { ids.contains($0.id)  }
    }
    
    func fetchUserWithId(_ id: UUID) -> UserProfile {
        return allUsers.first(where: { $0.id == id } )!
    }
    
    
    func fetchComentsForPost(postId: UUID) -> [PostComment] {
        return allComments.filter { $0.inReplyTo == postId }.sorted { $0.date > $1.date }
    }
    
    func fetchStoriesForUser(userId: UUID) -> [Post] {
        return allPosts.filter { $0.postedBy == userId }.filter { $0.postType == .story }
    }
    
    func addPostForUser(user: UserProfile, post: Post) {
        if let userIndex = allUsers.firstIndex(where: { $0.id == user.id } ) {
            allUsers[userIndex].posts.insert(post.id)
        }
        allPosts.append(post)
        save()
    }
    
    func fetchPostsForSignedOnUser(_ user: UserProfile) -> [Post] {
        let allPostsForUser = allPosts.filter { $0.postedBy == user.id }
        return allPostsForUser.filter { $0.postType != .story }
    }
    
    
    
    
    private func save() {
        FileManager.default.writeData(allUsers, to: "users")
        FileManager.default.writeData(allPosts, to: "posts")
        FileManager.default.writeData(allComments, to: "comments")
        FileManager.default.writeData(allLikes, to: "likes")
    }
    
}



