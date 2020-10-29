//
//  PreviewMockData.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import SwiftUI

enum PreviewMockData {
    
    static func getSignedOnUser() -> UserProfile {
        var primaryUser = UserProfile(userName: "aidanjames", name: "Aidan Pendleburyt", imageUrl: "primaryProfile")
        var celebrity = UserProfile(userName: "therealrock", name: "Rock Johnson", imageUrl: "secondaryProfile")
        var celebrity2 = UserProfile(userName: "kimkardashian", name: "Kim Kardashian West", imageUrl: "tertiaryProfile")
        
        var aPost = Post(postedBy: celebrity, postType: .photo, postUrl: "pumped")
        aPost.postText = "PUMPED! 🏋🏻"
        aPost.comments.append(PostComment(commentor: primaryUser, comment: "Do you even lift!?"))
        aPost.comments.append(PostComment(commentor: celebrity, comment: "Duuuuuude."))
        aPost.comments.append(PostComment(commentor: primaryUser, comment: "Jk... obvs 🙂"))
        aPost.likedBy.append(celebrity2)
        celebrity2.likes.append(aPost)
        aPost.likedBy.append(celebrity)
        celebrity.likes.append(aPost)
        aPost.date = Date().addingTimeInterval(-700000)
        
        var anotherPost = Post(postedBy: celebrity, postType: .photo, postUrl: "rockDad")
        anotherPost.postText = "This is dad back in the day..."
        anotherPost.date = Date().addingTimeInterval(-13)
        
        let storyPost = Post(postedBy: celebrity, postType: .story, postUrl: "")
        
        celebrity.posts.append(aPost)
        celebrity.posts.append(anotherPost)
        celebrity.posts.append(storyPost)
        
        
        
        var aPost2 = Post(postedBy: celebrity2, postType: .photo, postUrl: "normal")
        aPost2.postText = "40 and feeling so humbled and blessed. There is not a single day that I take for granted, especially during these times when we are all reminded of the things that truly matter. #ThisIs40"
        aPost2.comments.append(PostComment(commentor: celebrity, comment: "WTF?"))
        aPost2.comments.append(PostComment(commentor: celebrity, comment: "You fucking suck."))
        aPost2.comments.append(PostComment(commentor: celebrity, comment: "No words."))
        aPost2.comments.append(PostComment(commentor: celebrity, comment: "I’m really happy for you. My Dad died and we couldn’t have a funeral."))
        aPost2.comments.append(PostComment(commentor: celebrity, comment: "Duuuuuude."))
        aPost2.comments.append(PostComment(commentor: primaryUser, comment: "Sharing this lavish party, while record numbers of Americans are in line all day at food banks, hoping they don't run out - I am as speechless as Kim Kardashian is clueless!"))
        aPost2.likedBy.append(celebrity2)
        celebrity2.likes.append(aPost2)
        aPost2.likedBy.append(celebrity)
        celebrity.likes.append(aPost2)
        aPost2.date = Date().addingTimeInterval(-3700)
        
        var anotherPost2 = Post(postedBy: celebrity2, postType: .photo, postUrl: "meAndKanye")
        anotherPost2.postText = "Sorry about my last post #Awkward"
        anotherPost2.date = Date().addingTimeInterval(-2700)
        
        let storyPost2 = Post(postedBy: celebrity2, postType: .story, postUrl: "")
        
        celebrity2.posts.append(aPost2)
        celebrity2.posts.append(anotherPost2)
        celebrity2.posts.append(storyPost2)
        
        
        primaryUser.following.append(celebrity)
        primaryUser.following.append(celebrity2)
        
        return primaryUser
    }
    
    static func returnTinyProfileImage() -> some View {
        return Image("primaryProfile").resizable().scaledToFit().frame(width: 10, height: 10)
    }
    
}
