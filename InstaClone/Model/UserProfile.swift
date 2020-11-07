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
    var followers = Set<UUID>()  // user id
    var following = Set<UUID>()  // user id
    var posts = Set<UUID>()  // post id
    var likes = Set<UUID>()  // like id
    var savedPosts = Set<UUID>()  // post id
    var pendingFollowerRequests = Set<UUID>()  // user id
    var pendingFollowRequests = Set<UUID>()  // user id
    var chats = Set<UUID>()  // chat id
    var seenPosts = Set<UUID>() // post id
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
    var postedBy: UUID // posting user id
    var postType: PostType
    var postUrl: String
    var postText: String?
    var taggedPeople = Set<UUID>() // user id
    var location: String? // coordinates
    var comments = Set<UUID>() // comment id
    var likes = Set<UUID>() // like id
    var seenBy = Set<UUID>() // user id
    var expiry: Date? {
        if postType == .story {
            return date.addingTimeInterval(86400)
        }
        return nil
    }
}

struct PostComment: Identifiable, Codable {
    var id = UUID()
    var date = Date()
    var commentor: UUID // user id
    var comment: String
    var likes = Set<UUID>()  // like id
    var inReplyTo: UUID? // post comment id
}

struct DirectMessage: Identifiable, Codable {
    var id = UUID()
    var date = Date()
    var from: UUID // user id
    var linkedChat: UUID // chat id
    var chatText: String
}

struct Chat: Identifiable, Codable {
    var id = UUID()
    var messages = Set<UUID>()  // direct message id
}

struct Like: Identifiable, Codable {
    var id = UUID()
    var date = Date()
    var liker: UUID // id of user profile who likes post
    var postOrComment: UUID // id of post
}
