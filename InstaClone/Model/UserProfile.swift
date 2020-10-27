//
//  UserProfile.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import Foundation

struct UserProfile: Identifiable, Codable {
    var id = UUID()
    var userName: String
    var name: String
    var imageUrl: String
    var webSite: String?
    var bio: String?
    var isPrivate = false
    var followers = [UserProfile]()
    var following = [UserProfile]()
    var posts = [Post]()
    var likes = [Post]() // Create a new object for likes
    var savedPosts = [Post]()
    var pendingFollowerRequests = [UserProfile]()
    var pendingFollowRequests = [UserProfile]()
    var chats = [Chat]()
}

enum PostType: String, Codable {
    case photo
    case video
    case tvVideo
    case story
}

struct Post: Identifiable, Codable {
    var id = UUID()
    var date = Date()
    var postedBy: UserProfile
    var postType: PostType
    var postUrl: String
    var postText: String?
    var taggedPeople = [UserProfile]()
    var location: String?
    var comments = [PostComment]()
    var likedBy = [UserProfile]()
}

struct PostComment: Identifiable, Codable {
    var id = UUID()
    var date = Date()
    var commentor: UserProfile
    var comment: String
    var numberOfLikes = 0
}

struct DirectMessage: Identifiable, Codable {
    var id = UUID()
    var from: UserProfile
    var linkedChat: Chat
    var dateAndTime: Date
}

struct Chat: Identifiable, Codable {
    var id = UUID()
    var messages: [DirectMessage]
}
