//
//  PreviewMockData.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import SwiftUI

enum PreviewMockData {

    static func createMockData() {
        var user1 = UserProfile(userName: "aidanjames", name: "Aidan Pendleburyt", imageUrl: "primaryProfile")
        var user2 = UserProfile(userName: "therealrock", name: "Rock Johnson", imageUrl: "secondaryProfile")
        var user3 = UserProfile(userName: "kimkardashian", name: "Kim Kardashian West", imageUrl: "tertiaryProfile")
        
        user1.following.insert(user2.id)
        user1.following.insert(user3.id)
        
        // USER2'S POSTS
        
        // *****Post 1*****
        var user2Post1 = Post(postedBy: user2.id, postType: .photo, postUrl: "pumped")
        user2Post1.postText = "PUMPED! 🏋🏻"
        user2Post1.date = Date().addingTimeInterval(-700000)
        user2.posts.insert(user2Post1.id)
        
        // Comments for user2 post1
        let user2Post1Comment1 = PostComment(commentor: user1.id, comment: "Do you even lift!?")
        user2Post1.comments.insert(user2Post1Comment1.id)
        let user2Post1Comment2 = PostComment(commentor: user2.id, comment: "Duuuuuude.")
        user2Post1.comments.insert(user2Post1Comment2.id)
        let user2Post1Comment3 = PostComment(commentor: user1.id, comment: "Jk... obvs 🙂")
        user2Post1.comments.insert(user2Post1Comment3.id)
        
        // Likes for user2 post1
        let user2Post1Like1 = Like(liker: user3.id, postOrComment: user2Post1.id)
        user2Post1.likes.insert(user2Post1Like1.id)
        user3.likes.insert(user2Post1Like1.id)
        let user2Post1Like2 = Like(liker: user2.id, postOrComment: user2Post1.id)
        user2Post1.likes.insert(user2Post1Like2.id)
        user2.likes.insert(user2Post1Like1.id)

        // *****Post 2*****
        var user2Post2 = Post(postedBy: user2.id, postType: .photo, postUrl: "rockDad")
        user2Post2.postText = "This is dad back in the day..."
        user2Post2.date = Date().addingTimeInterval(-13)
        user2.posts.insert(user2Post2.id)
        
        // *****Post 3*****
        let user2Post3 = Post(postedBy: user2.id, postType: .story, postUrl: "")
        user2.posts.insert(user2Post3.id)
        
        
        // USER3'S POSTS
        
        // *****Post 1*****
        var user3Post1 = Post(postedBy: user3.id, postType: .photo, postUrl: "normal")
        user3Post1.postText = "40 and feeling so humbled and blessed. There is not a single day that I take for granted, especially during these times when we are all reminded of the things that truly matter. #ThisIs40"
        user3Post1.date = Date().addingTimeInterval(-3700)
        user3.posts.insert(user3Post1.id)
        
        // Comments for user3 post1
        let user3Post1Comment1 = PostComment(commentor: user2.id, comment: "WTF?")
        user3Post1.comments.insert(user3Post1Comment1.id)
        let user3Post1Comment2 = PostComment(commentor: user2.id, comment: "You fucking suck.")
        user3Post1.comments.insert(user3Post1Comment2.id)
        let user3Post1Comment3 = PostComment(commentor: user2.id, comment: "No words.")
        user3Post1.comments.insert(user3Post1Comment3.id)
        let user3Post1Comment4 = PostComment(commentor: user2.id, comment: "I’m really happy for you. My Dad died and we couldn’t have a funeral.")
        user3Post1.comments.insert(user3Post1Comment4.id)
        let user3Post1Comment5 = PostComment(commentor: user2.id, comment: "Duuuuuude.")
        user3Post1.comments.insert(user3Post1Comment5.id)
        let user3Post1Comment6 = PostComment(commentor: user1.id, comment: "Sharing this lavish party, while record numbers of Americans are in line all day at food banks, hoping they don't run out - I am as speechless as Kim Kardashian is clueless!")
        user3Post1.comments.insert(user3Post1Comment6.id)
        
        // Likes for user3 post1
        let user3Post1Like1 = Like(liker: user3.id, postOrComment: user3Post1.id)
        user3Post1.likes.insert(user3Post1Like1.id)
        user3.likes.insert(user3Post1Like1.id)
        let user3Post1Like2 = Like(liker: user2.id, postOrComment: user3Post1.id)
        user3Post1.likes.insert(user3Post1Like2.id)
        user2.likes.insert(user3Post1Like2.id)
        
        
        // *****Post 2*****
        var user3Post2 = Post(postedBy: user3.id, postType: .photo, postUrl: "meAndKanye")
        user3Post2.postText = "Sorry about my last post #Awkward"
        user3Post2.date = Date().addingTimeInterval(-2700)
        user3.posts.insert(user3Post2.id)
        
        // *****Post 3*****
        let user3Post3 = Post(postedBy: user3.id, postType: .story, postUrl: "")
        user3.posts.insert(user3Post3.id)
        
        // Save users
        let allUsers = [user1, user2, user3]
        FileManager.default.writeData(allUsers, to: "users")
        
        // Save posts
        let allPosts = [user2Post1, user2Post2, user2Post3, user3Post1, user3Post2, user3Post3]
        FileManager.default.writeData(allPosts, to: "posts")
        
        // Save comments
        let allComments = [user2Post1Comment1, user2Post1Comment2, user2Post1Comment3, user3Post1Comment1, user3Post1Comment2, user3Post1Comment3, user3Post1Comment4, user3Post1Comment5, user3Post1Comment6]
        FileManager.default.writeData(allComments, to: "comments")
        
        // Save likes
        let allLikes = [user2Post1Like1, user2Post1Like2, user3Post1Like1, user3Post1Like2]
        FileManager.default.writeData(allLikes, to: "likes")
        
    }
    
//    static func getSignedOnUser() -> UserProfile {
//
//
//
//
//        var primaryUser = UserProfile(userName: "aidanjames", name: "Aidan Pendleburyt", imageUrl: "primaryProfile")
//        var celebrity = UserProfile(userName: "therealrock", name: "Rock Johnson", imageUrl: "secondaryProfile")
//        var celebrity2 = UserProfile(userName: "kimkardashian", name: "Kim Kardashian West", imageUrl: "tertiaryProfile")
//
//        // CELEBRITY'S POSTS
//        var aPost = Post(postedBy: celebrity.id, postType: .photo, postUrl: "pumped")
//        aPost.postText = "PUMPED! 🏋🏻"
//        aPost.comments.append(PostComment(commentor: primaryUser.id, comment: "Do you even lift!?").id)
//        aPost.comments.append(PostComment(commentor: celebrity.id, comment: "Duuuuuude.").id)
//        aPost.comments.append(PostComment(commentor: primaryUser.id, comment: "Jk... obvs 🙂").id)
//        aPost.likedBy.append(celebrity2.id)
//        celebrity2.likes.append(aPost.id)
//        aPost.likedBy.append(celebrity.id)
//        celebrity.likes.append(aPost.id)
//        aPost.date = Date().addingTimeInterval(-700000)
//        celebrity.posts.append(aPost.id)
//
//        var anotherPost = Post(postedBy: celebrity.id, postType: .photo, postUrl: "rockDad")
//        anotherPost.postText = "This is dad back in the day..."
//        anotherPost.date = Date().addingTimeInterval(-13)
//        celebrity.posts.append(anotherPost.id)
//
//        let storyPost = Post(postedBy: celebrity.id, postType: .story, postUrl: "")
//        celebrity.posts.append(storyPost.id)
//
//        // CELEBRITY2'S POSTS
//        var aPost2 = Post(postedBy: celebrity2.id, postType: .photo, postUrl: "normal")
//        aPost2.postText = "40 and feeling so humbled and blessed. There is not a single day that I take for granted, especially during these times when we are all reminded of the things that truly matter. #ThisIs40"
//        aPost2.comments.append(PostComment(commentor: celebrity.id, comment: "WTF?").id)
//        aPost2.comments.append(PostComment(commentor: celebrity.id, comment: "You fucking suck.").id)
//        aPost2.comments.append(PostComment(commentor: celebrity.id, comment: "No words.").id)
//        aPost2.comments.append(PostComment(commentor: celebrity.id, comment: "I’m really happy for you. My Dad died and we couldn’t have a funeral.").id)
//        aPost2.comments.append(PostComment(commentor: celebrity.id, comment: "Duuuuuude.").id)
//        aPost2.comments.append(PostComment(commentor: primaryUser.id, comment: "Sharing this lavish party, while record numbers of Americans are in line all day at food banks, hoping they don't run out - I am as speechless as Kim Kardashian is clueless!").id)
//        aPost2.likedBy.append(celebrity2.id)
//        celebrity2.likes.append(aPost2.id)
//        aPost2.likedBy.append(celebrity.id)
//        celebrity.likes.append(aPost2.id)
//        aPost2.date = Date().addingTimeInterval(-3700)
//
//        var anotherPost2 = Post(postedBy: celebrity2.id, postType: .photo, postUrl: "meAndKanye")
//        anotherPost2.postText = "Sorry about my last post #Awkward"
//        anotherPost2.date = Date().addingTimeInterval(-2700)
//
//        let storyPost2 = Post(postedBy: celebrity2.id, postType: .story, postUrl: "")
//
//        celebrity2.posts.append(aPost2.id)
//        celebrity2.posts.append(anotherPost2.id)
//        celebrity2.posts.append(storyPost2.id)
//
//
//        primaryUser.following.append(celebrity.id)
//        primaryUser.following.append(celebrity2.id)
//
//        return primaryUser
//    }
    
    static func returnTinyProfileImage() -> some View {
        return Image("primaryProfile").resizable().scaledToFit().frame(width: 10, height: 10)
    }
    
}
